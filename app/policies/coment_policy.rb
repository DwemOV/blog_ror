class ComentPolicy < ApplicationPolicy
  def destroy?
    user.role_admin? || (object.user == user)
  end

  def update?
    user.role_admin? || user.role_moderator? ||(object.user == user)
  end
end