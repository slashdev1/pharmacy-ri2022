class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]
  before_action :authorize_prescription!

  def index
    @prescriptions = policy_scope(Prescription)
                       .joins('inner join products on prescriptions.product_id = products.id')
                       .joins('inner join users on prescriptions.doctor_id = users.id')
                       .select('prescriptions.*, products.name as product_name, users.name as doctor_name')
  end

  def show
  end

  def new
    @prescription = Prescription.new
  end

  def edit
  end

  def create
    @prescription = Prescription.new(prescription_params)
    fill_new_prescription_by_defaults

    if @prescription.save
      redirect_to @prescription, notice: 'Рецепт був успішно створений.'
    else
      render :new
    end
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: 'Рецепт був успішно оновлений.'
    else
      render :edit
    end
  end

  def destroy
    @prescription.destroy
    redirect_to prescriptions_url, notice: 'Рецепт був успішно видалений.'
  end

  private

  def set_prescription
    @prescription = Prescription.joins('inner join products on prescriptions.product_id = products.id')
                                .joins('inner join users on prescriptions.doctor_id = users.id')
                                .select('prescriptions.*, products.name as product_name, users.name as doctor_name')
                                .find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:number, :product_id, :expiry_date)
  end

  def fill_new_prescription_by_defaults
    @prescription.is_used = false
    @prescription.doctor_id = current_user.id
    @prescription.for_adult_children = Product.find(@prescription.product_id).for_adult_children
  end

  def authorize_prescription!
    authorize(@prescription || Prescription)
  end
end
