class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true  # Anyone can view a chicken
  end

  def new?
    true
  end

  def create?
    true  # Anyone can create a chicken
  end

  def update?
    true
    # record.user == user  # Only chicken creator can update it
  end

  def destroy?
    true
    # record.user == user  # Only chicken creator can update it
  end
end
