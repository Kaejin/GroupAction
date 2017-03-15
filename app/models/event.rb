class Event < ApplicationRecord
  belongs_to :user
  belongs_to :fundraiser
  has_many :event_donations
end
