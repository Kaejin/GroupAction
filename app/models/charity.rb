class Charity < ApplicationRecord
  belongs_to :user

  def total_raised
    self.amount_raised = 0
    self.user.fundraisers.each { |fundraiser| self.amount_raised += fundraiser.total_raised unless fundraiser.total_raised.nil? }
    self.amount_raised
  end
end
