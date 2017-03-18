class FundraiserUpdate < ApplicationRecord
  belongs_to :fundraiser


  def video_url
    url = self.link.split("v=")[1]
    return url
  end

end
