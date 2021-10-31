require 'application_system_test_case'

class MainTest < ApplicationSystemTestCase
	setup do
		@user = users(:test_user)
	end

	test "login_successful" do
		visit main_path
		fill_in "Email", with: @user.email
		fill_in "Password", with: '111111'
		click_on "LogIn"
		click_on "Profile"
		assert_text "Name: #{@user.name}"
	end

	test "login_with_wrong_pass" do
		visit main_path
		fill_in "Email", with: @user.email
		fill_in "Password", with: "012345"
		click_on "LogIn"
		assert_text "Log in failed, wrong email or password !!"
	end

	test "login_with_unknown_email" do
		visit main_path
		fill_in "Email", with: "111@hotmail.com"
		fill_in "Password", with: "111111"
		click_on "LogIn"
		assert_text "Log in failed, wrong email or password !!"
	end

	test "like_testing" do
		visit main_path
		fill_in "Email", with: @user.email
		fill_in "Password", with: '111111'
		click_on "LogIn"
		click_on "Post"
		fill_in "Msg", with: "MSG1"
		click_on "Create Post"
		assert_text "Post was successfully created."
		assert_text "0 Like"
		click_on "Like"
		assert_text "1 Like"
		click_on "Profile"
		assert_text "1 Like"
    end
end