require 'spec_helper'
require 'rails_helper'

describe "Signing up" do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up")
		click_link "Sign Up"

		fill_in "First Name", with: "Steve"
		fill_in "Last Name", with: "Ono"
		fill_in "Email", with: "steve@gmail.com"
		fill_in "Password", with: "abcdef"
		fill_in "Password (again)", with: "abcdef"
		click_button "Sign Up"

		expect(User.count).to eq(1)
	end
end