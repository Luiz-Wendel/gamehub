class AdminPolicy < ApplicationPolicy

  def new?
    user.full?
  end

  def edit?
    user.full?
  end

  def permitted_attributes
    if user.full?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.full?
        scope.all
      else
        scope.with_restricted_access # Definido no models do admin
      end
    end
  end
end
