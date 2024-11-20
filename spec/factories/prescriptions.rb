FactoryBot.define do
  factory :prescription do
    detail { Faker::Lorem.sentence(word_count: 50) }
    date { Faker::Date.backward }
    remark { Faker::Lorem.sentence(word_count: 20) }
  end
end
