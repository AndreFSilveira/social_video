class Video < ActiveRecord::Base

	VALID_LINK_REGEX = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/

	validates :title , presence: true, length: { maximum: 100 }
	validates :link , presence: true, format: { with: VALID_LINK_REGEX},
  		uniqueness: true
end
