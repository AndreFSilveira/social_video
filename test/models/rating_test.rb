require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  def setup
    @rating = Rating.new(value: 3)
  end

  test "should be a valid attributes" do
    @rating.value = ""
    assert_not @rating.valid?, "Value cannot be empty"

    @rating.value = "a"
    assert_not @rating.valid?, "Value cannot be string"
  end
end
