class News < ActiveRecord::Base

  has_many :news_tags, :dependent => :destroy
  has_many :tags, through: :news_tags
  has_many :comments, dependent: :destroy

	validates :title , presence: true, length: { maximum: 100 }
	validates :content , presence: true, length: { minimum: 10 }

  ratyrate_rateable "news"
  translates :title, :content, :tags

  def self.search(search)
    if search
      params = {:search => "%#{search}%"}
      where("title_pt_br LIKE :search
            OR title_es LIKE :search
            OR content_pt_br LIKE :search
            OR content_es LIKE :search ",params)
    else
      all
    end
  end

end
