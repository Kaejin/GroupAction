class DirectDonation < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event
end
