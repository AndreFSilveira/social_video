class Video < ActiveRecord::Base

	has_many :video_tags, :dependent => :destroy
	has_many :tags, through: :video_tags
	has_many :comments, dependent: :destroy

	VALID_LINK_REGEX = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/

	validates :title , presence: true, length: { maximum: 100 }
	validates :link , presence: true, format: { with: VALID_LINK_REGEX},
  		uniqueness: true
	validates_associated :video_tags

	ratyrate_rateable "video"
	translates :title, :tags

end
