class EventUpdatePolicy < ApplicationPolicy

  def new?
    record.event.user == user
  end

  def show?
    record.event.user == user
  end

  def create?
    record.event.user == user
  end

  def edit?
    record.event.user == user
  end

  def update?
    record.event.user == user
  end

  def destroy?
    record.event.user == user
  end
end
