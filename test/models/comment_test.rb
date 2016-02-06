require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content:"Teste comentário teste")
  end

  test "should be a valid attributes" do
    @comment.content = ""
    assert_not @comment.valid?, "Content cannot be empty"

    @comment.content = "a"* 5
    assert_not @comment.valid?, "Content not can be minimum length"
  end
end
