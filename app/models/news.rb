class News < ActiveRecord::Base
	validates :title , presence: true, length: { maximum: 100 }
	validates :content , presence: true, length: { minimum: 10 }
end