FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    dob { Faker::Date.birthday(min_age: 1, max_age: 100) }

    trait :invalid do
      phone { "invalid_phone" }
    end
  end
end
