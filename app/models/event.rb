class Event < ApplicationRecord
  belongs_to :user
  belongs_to :fundraiser
  validates :target, presence: true
  has_many :event_donations
  has_many :event_videos


  def total_raised
    self.amount_raised = 0
    self.event_donations.each { |donation| self.amount_raised += donation.amount }
    self.amount_raised
  end

end

