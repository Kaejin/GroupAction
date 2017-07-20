class Fundraiser < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :direct_donations
  has_many :fundraiser_videos
  has_many :fundraiser_updates
  has_many :offline_donations, as: :imageable
  validates :goal, inclusion: { in: ['Raise Money', 'Find Volunteers'], message: "%{value} is not a valid selection" }
  validates :label, inclusion: { in: ['People', 'Planet', 'Dignity'], message: "%{value} is not a valid selection" }
  has_attachments :photos, maximum: 5

  #has_many :event_donations, through: :event

  def total_raised
    self.amount_raised = 0
    self.direct_donations.each { |donation| self.amount_raised += donation.amount }
    self.offline_donations.each { |donation| self.amount_raised += donation.amount }
    self.events.each { |event| self.amount_raised += event.total_raised }
    self.amount_raised
  end

end
