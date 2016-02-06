require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  	
  	def setup
  		@news = News.new(title:"Noticia Teste", content:"Teste noticia teste")
  	end

  	test "should be a valid attributes" do
  		@news.title = ""
  		assert_not @news.valid?, "Title cannot be empty"

  		@news.content = ""
  		assert_not @news.valid?, "Content cannot be empty"

  		@news.title = "a"* 101
  		assert_not @news.valid?, "Title not can be exceed maximum length"

  		@news.content = "a"* 5
  		assert_not @news.valid?, "Content not can be minimum length"
  	end
end
