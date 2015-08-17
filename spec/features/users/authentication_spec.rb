require 'spec_helper'
require 'rails_helper'

describe "Logging In" do
	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Steve", last_name: "Ono", email: "steve@gmail.com", password: "abcd", password_confirmation: "abcd")
		visit new_user_session_path

		fill_in "Email", with: "steve@gmail.com"
		fill_in "Password", with: "abcd"
		click_button "Log In"

		expect(page).to have_content("Todo Lists")
		expect(page).to have_content("Thanks for logging in!")
	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email", with: "steve@gmail.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		expect(page).to have_content("There was a problem logging in. Please check your credentials.")
		expect(page).to have_field("Email", with: "steve@gmail.com")
	end
end