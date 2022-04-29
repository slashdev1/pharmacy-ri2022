class ArrivalsController < ApplicationController
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]

  # GET /arrivals
  def index
    @arrivals = Arrival.all
  end

  # GET /arrivals/1
  def show
  end

  # GET /arrivals/new
  def new
    @arrival = Arrival.new
  end

  # GET /arrivals/1/edit
  def edit
  end

  # POST /arrivals
  def create
    @arrival = Arrival.new(arrival_params)

    if @arrival.save
      redirect_to @arrival, notice: 'Arrival was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /arrivals/1
  def update
    if @arrival.update(arrival_params)
      redirect_to @arrival, notice: 'Arrival was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /arrivals/1
  def destroy
    @arrival.destroy
    redirect_to arrivals_url, notice: 'Arrival was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def arrival_params
      params.fetch(:arrival, {})
    end
end
