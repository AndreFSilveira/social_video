class News < ActiveRecord::Base

  has_many :news_tags, :dependent => :destroy
  has_many :tags, through: :news_tags
  has_many :comments, dependent: :destroy

	validates :title , presence: true, length: { maximum: 100 }
	validates :content , presence: true, length: { minimum: 10 }

  ratyrate_rateable "news"
  translates :title, :content, :tags

  searchable do
    text :title, :content
  end

end
