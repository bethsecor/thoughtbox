class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, url: true
end
