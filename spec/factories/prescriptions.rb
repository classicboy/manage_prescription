FactoryBot.define do
  factory :prescription do
    detail { Faker::Lorem.sentence }
  end
end
