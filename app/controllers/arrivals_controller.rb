class ArrivalsController < ApplicationController
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]
  before_action :authorize_arrival!

  def index
    @arrivals = Arrival.joins('inner join products on arrivals.product_id = products.id')
                       .select('arrivals.*, products.name as product_name')
  end

  def show
  end

  def new
    @arrival = Arrival.new
  end

  def edit
  end

  def create
    @arrival = Arrival.new(arrival_params)
    if @arrival.save
      StockManager.change_qty(@arrival.product_id, @arrival.qty)
      redirect_to @arrival, notice: 'Надходження було успішно збережене.'
    else
      render :new
    end
  end

  def update
    if @arrival.update(arrival_params)
      redirect_to @arrival, notice: 'Arrival was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @arrival.destroy
    redirect_to arrivals_url, notice: 'Arrival was successfully destroyed.'
  end

  private

  def set_arrival
    @arrival = Arrival.joins('inner join products on arrivals.product_id = products.id')
                      .select('arrivals.*, products.name as product_name')
                      .find(params[:id])
  end

  def arrival_params
    params.fetch(:arrival, {}).permit([:product_id, :price, :qty])
  end

  def authorize_arrival!
    authorize(@arrival || Arrival)
  end
end
