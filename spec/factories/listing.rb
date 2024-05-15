FactoryBot.define do
  factory :listing do
    company { Faker::Company.name }
    url { Faker::Internet.url }
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    product { Faker::Company.industry }
    based_in { Faker::Address.country }
    timezones { Faker::Address.time_zone }
    stack { Faker::ProgrammingLanguage.name }
    compensation { Faker::Commerce.price }
    pto { Faker::Lorem.paragraph }
    remote { Faker::Boolean.boolean }
    glassdoor_url { Faker::Internet.url }
    glassdoor_rating { Faker::Number.within(range: 1..50) }
    notes { Faker::Lorem.paragraph }
    preference { Faker::Number.within(range: 1..100) }
  end
end
