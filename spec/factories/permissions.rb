FactoryGirl.define do
  factory :permission do
#    role_permission_ids { Faker:: }
    name     { Faker::Name.name }
    description     { Faker::Lorem.paragraph }
#    value     { Faker::Number.number(1) }
  end

  factory :invalid_permission, parent: :permission do |f|
    f.name nil
  end

end
