FactoryBot.define do
  factory :doctor do
    email { Faker::Internet.unique.email }
    username { Faker::Name.unique.first_name }
    password { Faker::Internet.password }
  end

  trait :invalid do
    email { "invalid_email" }
  end
end
