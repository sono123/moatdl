require 'spec_helper'
require 'rails_helper'
include AuthenticationHelpers::Feature

RSpec.describe "TodoLists", type: :request do
  describe "GET /todo_lists" do
  	let(:user) { create(:user) }

	  before do
			sign_in(user, password: "abcd")
		end

    it "works! (now write some real specs)" do
      get "/todo_lists"
      # expect(response).to have_http_status(200)
    end
  end
end
