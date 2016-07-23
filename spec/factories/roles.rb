FactoryGirl.define do
  
  factory :role do
    name     { Faker::Name.name }
    description     { Faker::Lorem.paragraph }
  end

  factory :invalid_role, parent: :role do |f|
    f.name nil
  end

end
