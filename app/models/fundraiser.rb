class Fundraiser < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :direct_donations
  has_many :event_donations, through: :event
end
