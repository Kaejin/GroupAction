class FundraiserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def new?
    user.verified
  end

  def create?
    user.verified
  end

  def show?
    true
  end

  def edit?
    user.verified && record.user == user
  end

  def update?
    user.verified && record.user == user
  end

  def destroy?
    user.verified && record.user == user
  end
end
