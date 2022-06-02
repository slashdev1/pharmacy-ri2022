class OrdersController < ApplicationController
  include OrdersMethods

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authorize_order!, except: [:new]

  def index
    @orders = policy_scope(Order).ordered_by_date
  end

  def show
  end

  def new
    if !user_signed_in?
      raise Pundit::NotAuthorizedError, 'Для створення замовлення треба авторизуватись!'
    end
    @order = Order.new
  end

  def edit
  end

  def create
    Rails.logger.info 'Creating new order with params: #{order_params.inspect}'

    @order = Order.new(order_params)
    fill_new_order_by_defaults

    # calculate amount
    order_params[:order_details_attributes].each do |k, detail|
      @order.amount += detail[:qty].to_i * detail[:price].to_i
    end

    prev_order_status_id = nil
    if check_stock && @order.save
      update_stock(prev_order_status_id)

      Rails.logger.info 'Created order ##{@order.id}'

      OrderMailer.order_placed(current_user, @order).deliver_later

      redirect_to @order, notice: 'Замовлення було успішно створене.'
    else
      render :new
    end
  end

  def update
    prev_order_status_id = get_prev_order_status_id
    if check_prescriptions && @order.update(order_params)
      update_stock(prev_order_status_id)
      set_used_for_prescriptions

      redirect_to @order, notice: 'Замовлення було успішно оновлено.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Замовлення було успішно видалено.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    list_params_allowed = [order_details_attributes: [:id, :product_id, :qty, :price, :prescription_number, :_destroy]]
    list_params_allowed << :comment
    if current_user.is_pharmacist?
      list_params_allowed << :order_status_id
    end
    params.fetch(:order, {}).permit(list_params_allowed)
  end

  def authorize_order!
    authorize(@order || Order)
  end
end
