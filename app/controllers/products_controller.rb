class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_product!

  def index
    @products = Product.with_stock.ordered_by_name
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Ліки були успішно створені.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Ліки були успішно оновлені.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Ліки були успішно видалені.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.fetch(:product, {}).permit(:name, :price, :required_prescription, :for_adult_children, :description, :img_url)
  end

  def authorize_product!
    authorize(@product || Product)
  end
end
