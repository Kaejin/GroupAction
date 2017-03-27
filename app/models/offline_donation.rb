class OfflineDonation < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
