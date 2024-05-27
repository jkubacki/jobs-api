FactoryBot.define do
  factory :application do
    listing
    applied_at { Faker::Date.in_date_period }
    cv { Faker::Boolean.boolean }
    cover_letter { Faker::Lorem.paragraph }
    notes { Faker::Lorem.paragraph }
    preference { Faker::Number.within(range: 1..100) }
  end
end
