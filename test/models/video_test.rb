require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  
  def setup
  		@video = Video.new(title:"Video Teste", link:"https://www.youtube.com/watch?v=fadd879aU5bw")
  	end

  	test "should be a valid attributes" do
  		assert @video.valid?, "Link and title correct"

  		@video.title = ""
  		assert_not @video.valid?, "Title cannot be empty"

  		@video.link = ""
  		assert_not @video.valid?, "Link cannot be empty"

  		@video.title = "a"* 101
  		assert_not @video.valid?, "Title not can be exceed maximum length"

  		@video.link = "a"* 50
  		assert_not @video.valid?, "Link not correct"

  		another_video = @video.dup
  		another_video.link = @video.link
  		@video.save
  		assert_not another_video.valid?
  	end

end
