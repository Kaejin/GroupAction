class EventVideo < ApplicationRecord
  belongs_to :event

  def video_url
    url = self.link.split("v=")[1]
    return url
  end

end
