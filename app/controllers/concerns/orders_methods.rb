module OrdersMethods
  extend ActiveSupport::Concern

  included do
    private

    def fill_new_order_by_defaults
      @order.user = current_user
      @order.order_status_id = OrderStatus.get_prepared_status_id
      @order.amount = 0
    end

    def check_prescriptions
      alright = true
      return alright if @order.new_record? || order_params[:order_status_id].to_i == OrderStatus.get_reject_status_id

      order_params[:order_details_attributes].each do |k, detail|
        product = Product.find(detail[:product_id].to_i)
        if !product.required_prescription
          next
        end

        # prescriptions checking
        if detail[:prescription_number].empty?
          @order.errors[:base] << "Не вказаний номер рецепта для ліки #{product.name}"
          alright = false
          next
        end

        prescription_number = detail[:prescription_number]
        prescription = Prescription.find_by_number(prescription_number)

        if prescription.nil?
          @order.errors[:base] << "Не знайдено рецепт №#{prescription_number}"
          alright = false
          next
        end

        if prescription.is_used
          @order.errors[:base] << "Рецепт №#{prescription_number} вже використаний"
          alright = false
          next
        end

        if prescription.product_id != product.id
          @order.errors[:base] << "Рецепт №#{prescription_number} виписаний для другої ліки"
          alright = false
          next
        end

        if prescription.expiry_date + 1 <= @order.created_at
          @order.errors[:base] << "Термін дії рецепту №#{prescription_number} вичерпаний"
          alright = false
          next
        end
      end

      alright
    end

    def check_stock
      alright = true

      order_params[:order_details_attributes].each do |k, detail|
        available_qty = StockManager.get_qty(detail[:product_id].to_i)
        if available_qty < detail[:qty].to_i
          product = Product.find(detail[:product_id].to_i)
          @order.errors[:base] << "Недостатньо залишку для ліки #{product.name}, в наявності #{available_qty} шт"
          alright = false
        end
      end

      alright
    end

    def get_prev_order_status_id
      @order.new_record? ? nil : Order.find(@order.id).order_status_id
    end

    def update_stock(prev_order_status_id)
      # New order must reserve products on stock
      # Approved order must decrease stock and remove reservation

      if prev_order_status_id != @order.order_status_id
        if prev_order_status_id == OrderStatus.get_prepared_status_id
          # removing reservation
          order_params[:order_details_attributes].each do |k, detail|
            StockManager.change_qty(detail[:product_id].to_i, nil, -detail[:qty].to_i)
          end
        end

        if @order.order_status_id == OrderStatus.get_prepared_status_id
          # making reservation
          order_params[:order_details_attributes].each do |k, detail|
            StockManager.change_qty(detail[:product_id].to_i, nil, detail[:qty].to_i)
          end
        elsif @order.order_status_id == OrderStatus.get_done_status_id
          # removing reservation and decreasing stock
          order_params[:order_details_attributes].each do |k, detail|
            StockManager.change_qty(detail[:product_id].to_i, -detail[:qty].to_i)
          end
        end
      end
    end

    def set_used_for_prescriptions
      if @order.order_status_id == OrderStatus.get_done_status_id
        order_params[:order_details_attributes].each do |k, detail|
          product = Product.find(detail[:product_id].to_i)
          if !product.required_prescription
            next
          end

          prescription_number = detail[:prescription_number]
          prescription = Prescription.find_by_number(prescription_number)

          if !prescription.nil?
            prescription.is_used = true
            prescription.save
          end
        end
      end
    end
  end
end