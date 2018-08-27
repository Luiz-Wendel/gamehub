class AdminPolicy < ApplicationPolicy

  def new?
    user.full?
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
