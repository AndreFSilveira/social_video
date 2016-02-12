class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :video
  belongs_to :news

  validates :content, presence: true, length: {minimum: 10}

  translates :content
end
