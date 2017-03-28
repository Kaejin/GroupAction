class FundraiserUpdate < ApplicationRecord
  belongs_to :fundraiser
  has_attachments :photos, maximum: 5


  def video_url
    url = self.link.split("v=")[1]
    return url
  end

end
