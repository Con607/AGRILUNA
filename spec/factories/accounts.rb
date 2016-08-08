FactoryGirl.define do

	factory :account do
	  user_id { Faker::Number.number(4) }
	  plan_id { Faker::Number.number(4) }
	end

  	factory :invalid_account, parent: :account do |f|
  	  f.user_id nil
  	end

end
