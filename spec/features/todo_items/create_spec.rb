require 'spec_helper'
require 'rails_helper'

describe "Viewing todo lists" do
	let(:user) { todo_list.user }
	let!(:todo_list) { create(:todo_list) }

	before do
		sign_in(user, password: "abcd")
	end


	it "is successful with valid content" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: "Milk"
		click_button "Save"
		expect(page).to have_content("Added todo list item.")
		expect(page).to have_content("Milk")
	end


	it "displays an error with no content" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: ""
		click_button "Save"

		within "div.flash" do
			expect(page).to have_content("There was a problem adding that todo list item.")
		end

		expect(page).to have_content("Content can't be blank")
	end


	it "displays an error with content less than 2 characters long" do
		visit_todo_list(todo_list)
		click_link "New Todo Item"
		fill_in "Content", with: "1"
		click_button "Save"

		within "div.flash" do
			expect(page).to have_content("There was a problem adding that todo list item.")
		end

		expect(page).to have_content("Content is too short")
	end

end










