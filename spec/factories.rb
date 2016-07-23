FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'f4k3p455w0rd'
    #password_confirmation 'f4k3p455w0rd'
    #confirmed_at Date.today

    # if needed
    # is_active true
  end

  factory :account do
    email { Faker::Internet.email }
    password "password"
    #password_confirmation "password"
    #confirmed_at Date.today
  end

  factory :admin do
    email { Faker::Internet.email }
    password 'f4k3p455w0rd'
    #password_confirmation 'f4k3p455w0rd'
    #confirmed_at Date.today

    # if needed
    # is_active true
  end
end