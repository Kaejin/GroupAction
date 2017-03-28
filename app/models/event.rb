class Event < ApplicationRecord
  belongs_to :user
  belongs_to :fundraiser
  validates :target, presence: true
  has_many :event_donations
  has_many :event_videos
  has_many :event_updates
  has_many :offline_donations, as: :imageable
  has_attachments :photos, maximum: 5


  def total_raised
    self.amount_raised = 0
    self.event_donations.each { |donation| self.amount_raised += donation.amount }
    self.offline_donations.each { |donation| self.amount_raised += donation.amount}
    self.amount_raised
  end

end

