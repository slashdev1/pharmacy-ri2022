class OrderPolicy < ApplicationPolicy

  def index?
    !user.nil?
  end

  def show?
    !user.nil? && (user.is_admin? || user.is_pharmacist? || user.author?(record))#@record.id == user.id)
  end

  def create?
    !user.nil?
  end

  def edit?
    # Only prepared/pending order can be editable
    !user.nil? && (user.is_pharmacist?) && @record.is_prepered?
  end

  def update?
    !user.nil? && (user.is_pharmacist?)
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if user.nil?
        raise Pundit::NotAuthorizedError, 'Для перегляду переліку замовлень треба авторизуватись!'
      elsif user.is_pharmacist?
        scope.prepared
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
