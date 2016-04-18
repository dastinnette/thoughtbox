class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true

  def status
    if self.read?
      "mark as unread"
    else
      "mark as read"
    end
  end
end
