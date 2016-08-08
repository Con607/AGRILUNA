FactoryGirl.define do  
  
  factory :plan do
    name "MyString"
    company_ids 1
    greenhouse_ids 1
    user_ids 1
    users_allowed 1
    companies_allowed 1
    greenhouses_allowed 1
    cost_per_month_usd 1.5
    billing "MyString"
  end

  factory :user do
    email { Faker::Internet.email }
    password 'f4k3p455w0rd'
    password_confirmation 'f4k3p455w0rd'
    confirmed_at Date.today

    # if needed
    # is_active true
  end

  factory :admin do
    email { Faker::Internet.email }
    password 'f4k3p455w0rd'
    password_confirmation 'f4k3p455w0rd'
    confirmed_at Date.today

    # if needed
    # is_active true
  end
end