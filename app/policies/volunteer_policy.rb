class VolunteerPolicy < ApplicationPolicy

  def new?
    user.is_charity && user.verified && user.charity.present?
  end

  def create?
    user.is_charity && user.verified && user.charity.present?
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
