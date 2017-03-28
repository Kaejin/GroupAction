class CharityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def new?
    user.is_charity? && user.verified? && user.charity.nil?
  end

  def create?
    user.is_charity && user.verified? && user.charity == record
  end

  def show?
    true
  end

  def edit?
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
