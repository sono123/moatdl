require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    context "with correct credentials" do
      let!(:user) { User.create(first_name: "Steve", last_name: "Ono", email: "steve@gmail.com", password: "abcd", password_confirmation: "abcd") }
      
      it "redirects to the todo list path" do
        post :create, email: "steve@gmail.com", password: "abcd"
        expect(response).to be_redirect
        expect(response).to redirect_to(todo_lists_path)
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email: "steve@gmail.com"}).and_return(user)
        post :create, email: "steve@gmail.com", password: "abcd"
      end

      it "authenticates the user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "steve@gmail.com", password: "abcd"
      end
    end
  end

end





