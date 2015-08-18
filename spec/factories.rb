FactoryGirl.define do
	factory :user do
		first_name "First"
		last_name "Last"
		sequence(:email) { |n| "user#{n}@moatdl.com" }
		password "abcd"
		password_confirmation "abcd"
	end
end