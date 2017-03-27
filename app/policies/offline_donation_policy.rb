class OfflineDonationPolicy < ApplicationPolicy

  def new?
    record.imageable.nil?
  end

  def create?
    record.imageable.user == user
  end

  def edit?
    record.imageable.user == user
  end

  def update?
    record.imageable.user == user
  end

  def destroy?
    record.imageable.user == user
  end
end
