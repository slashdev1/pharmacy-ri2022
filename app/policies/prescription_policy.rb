class PrescriptionPolicy < ApplicationPolicy

  def index?
    user.is_doctor?
  end

  def show?
    user.is_doctor?
  end

  def create?
    user.is_doctor?
  end

  def update?
    user.is_doctor?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if !user.nil? && user.is_doctor?
        scope.where(doctor_id: user.id).order(expiry_date: :asc)
      else
        raise Pundit::NotAuthorizedError, 'Тільки лікар має право на цю дію!'
      end
    end
  end
end
