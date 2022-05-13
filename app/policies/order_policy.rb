class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.nil?
        scope.where('0 = 1')
      elsif user.is_doctor? || user.is_pharmacist?
        scope.all
      else
        scope.where(user_id: user.user_id)
      end
    end
  end
end
