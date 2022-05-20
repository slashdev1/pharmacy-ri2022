class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = policy_scope(Order) #Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    if !user_signed_in?
      raise NotImplementedError, "You must be authorized!"
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    Rails.logger.info 'Creating new order with params: #{order_params.inspect}'
    @order = Order.new(order_params)
    @order.user = current_user#User.all.sample #current_user #
    #@order.order_status = OrderStatus.find_by(name: 'Подготовлен')
    @order.order_status_id = 1
    @order.amount = 0
    order_params[:order_details_attributes].each do |k,v|
      @order.amount += v[:qty].to_i*v[:price].to_i
    end

    if @order.save
      Rails.logger.info 'Created order ##{@order.id}'
      OrderMailer.with(user: @user).order_placed.deliver_later
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {}).permit( order_details_attributes: [:product_id, :qty, :price, :_destroy])
    end
end
