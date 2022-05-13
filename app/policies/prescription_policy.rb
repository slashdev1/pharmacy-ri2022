class PrescriptionPolicy < ApplicationPolicy
  attr_reader :user, :prescription

  def initialize(user, prescription)
    @user = user
    @prescription = prescription
  end

  def new
    user.is_doctor?
  end

  def create?
    user.is_doctor?
  end

  def update?
    user.is_doctor?
  end
end
