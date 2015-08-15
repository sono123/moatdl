require 'rails_helper'

RSpec.describe User, type: :model do
	let(:valid_attributes) {
		{
			first_name: "Steve",
			last_name: "Ono",
			email: "steveono@gmail.com"
		}
	}


  context "validations" do
  	let(:user) { User.new(valid_attributes) }

  	before do
  		User.create(valid_attributes)
  	end

  	it "requires an email" do
  		expect(user).to validate_presence_of(:email)
  	end

  	it "requires a unique email" do
  		expect(user).to validate_uniqueness_of(:email)
  	end

  	it "requires a unique email (case insensitive)" do
  		user.email = "STEVE@GMAIL.COM"
  		expect(user).to validate_uniqueness_of(:email)
  	end


  	context "#downcase_email" do
  		it "makes the email attribute lower case" do
  			user = User.new(valid_attributes.merge(email: "STEVE@GMAIL.COM"))
	  		expect { user.downcase_email }.to change { user.email }.from("STEVE@GMAIL.COM").to("steve@gmail.com")
  		end

  		it "downcases an email before saving" do
	  		user = User.new(valid_attributes)
	  		user.email = "STEVE@GMAIL.COM"
	  		expect(user.save).to be true
	  		expect(user.email).to eq("steve@gmail.com")
  		end
  	end

  end

end










