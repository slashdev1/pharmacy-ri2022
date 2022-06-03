class ArrivalPolicy < ApplicationPolicy

  def index?
    !user.nil? && user.is_pharmacist?
  end

  def show?
    !user.nil? && user.is_pharmacist?
  end

  def create?
    !user.nil? && user.is_pharmacist?
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
