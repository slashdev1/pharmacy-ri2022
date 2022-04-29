class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  # GET /prescriptions
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
    raise 'Failed to edit prescription' #Викликати помилку за допомогою raise в методі контроллера
  end

  # GET /prescriptions/1/edit
  def edit
  end

  # POST /prescriptions
  def create
    @prescription = Prescription.new(prescription_params)

    if @prescription.save
      redirect_to @prescription, notice: 'Prescription was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prescriptions/1
  def update
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: 'Prescription was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prescriptions/1
  def destroy
    @prescription.destroy
    redirect_to prescriptions_url, notice: 'Prescription was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
      params.require(:prescription).permit(:number, :is_used, :doctor_id, :for_adult_children)
    end
end
