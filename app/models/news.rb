class News < ActiveRecord::Base

  has_many :news_tags, :dependent => :destroy
  has_many :tags, through: :news_tags
  has_many :comments, dependent: :destroy

  ratyrate_rateable "news"

	validates :title , presence: true, length: { maximum: 100 }
	validates :content , presence: true, length: { minimum: 10 }
end
