class UserPolicy < ApplicationPolicy

  def index?
    !user.nil? && user.is_admin?
  end

  def show?
    !user.nil? && (user.is_admin? || record == user)
  end

  def update?
    !user.nil? && (user.is_admin? || record == user)
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if !user.nil? && user.is_admin?
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'Ви не маєте адмінських прав!'
      end
    end
  end
end