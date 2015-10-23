class ItemPolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == user)
  end
  
  def destroy?
    create?
  end
end