require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(name:"campo")
  end

  test "should be a valid attributes" do
    @tag.name = ""
    assert_not @tag.valid?, "Name cannot be empty"

    @tag.name = "aa"
    assert_not @tag.valid?, "Name cannot be minimum length"

    @tag.name = "a"*51
    assert_not @tag.valid?, "Content cannot be maximum length"
  end
end
