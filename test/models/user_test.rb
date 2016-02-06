require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  	def setup
  		@user = User.new(name:"André Felipe Silveira", email:"andrefelipesilveira@gmail.com", password: "abc123", password_confirmation: "abc123")
  	end

  	test "should be a valid" do
  		assert @user.valid?
  	end

	test "should be a valid attributes" do
	  		@user.name = ""
	  		assert_not @user.valid?, "Name cannot be empty" 
	  		@user.email = ""
	  		assert_not @user.valid? "Email cannot be empty"

	  		@user.name = "teste"* 11
	  		assert_not @user.valid?, "Name cannot be too long"

	  		@user.email = "teste"* 30 + "@gmail.com"
	  		assert_not @user.valid?, "Email cannot be too long"

	  		@user.email = "teste+1"
	  		assert_not @user.valid?, "Email is not valid address"

	  		another_user = @user.dup
	  		another_user.email= @user.email.upcase
	  		@user.save
	  		assert_not another_user.valid?
	end

	test "should be a valid password" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?

		@user.password = @user.password_confirmation = "a"*5
		assert_not @user.valid?
	end


end
