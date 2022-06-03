class ProductPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.nil? && user.is_pharmacist?
  end

  def update?
    !user.nil? && user.is_pharmacist?
  end

  def destroy?
    false
  end
end
