FactoryGirl.define do
  
  factory :company do
    name     { Faker::Name.name }
    description     { Faker::Lorem.paragraph }
    address     { Faker::Address.street_address }
    telephone     { Faker::Number.number(10) }
  end

  factory :invalid_company, parent: :company do |f|
    f.name nil
  end

end
