class Comment < ActiveRecord::Base

  validates :content, presence: true, length: {minimum: 10}

  belongs_to :user
end
