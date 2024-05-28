FactoryBot.define do
  factory :reply do
    sent_at { Faker::Date.in_date_period }
    by_me { Faker::Boolean.boolean }
    rejected { Faker::Boolean.boolean }
    body { Faker::Lorem.paragraph }
    notes { Faker::Lorem.paragraph }
    preference { Faker::Number.within(range: 1..100) }

    application
  end
end
