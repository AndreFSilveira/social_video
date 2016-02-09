class Tag < ActiveRecord::Base

  has_many :news_tags
  has_many :newses, through: :news_tags
  has_many :video_tags
  has_many :videos, through: :video_tags

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
end
