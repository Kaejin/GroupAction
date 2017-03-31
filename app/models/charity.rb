class Charity < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 5

  def total_raised
    self.amount_raised = 0
    self.user.fundraisers.each { |fundraiser| self.amount_raised += fundraiser.total_raised unless fundraiser.total_raised.nil? }
    self.amount_raised
  end

  def number_donations
    no_donations = 0
    self.user.fundraisers.each do  |fundraiser|
      no_donations += fundraiser.direct_donations.count
      fundraiser.events.each { |event| no_donations += event.event_donations.count }
    end
    no_donations
  end

end
