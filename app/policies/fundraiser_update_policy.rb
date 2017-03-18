class FundraiserUpdatePolicy < ApplicationPolicy

  def new?
    record.fundraiser.user == user
  end

  def show?
    record.fundraiser.user == user
  end

  def create?
    record.fundraiser.user == user
  end

  def edit?
    record.fundraiser.user == user
  end

  def update?
    record.fundraiser.user == user
  end

  def destroy?
    record.fundraiser.user == user
  end
end
