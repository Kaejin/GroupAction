class DirectDonation < ApplicationRecord
  belongs_to :user
  belongs_to :fundraiser
end
