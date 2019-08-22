class ChickenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a chicken
  end

  def create?
    true  # Anyone can create a chicken
  end

  def update?
    record.user == user  # Only chicken creator can update it
  end

  def destroy?
    record.user == user  # Only chicken creator can update it
  end
end
