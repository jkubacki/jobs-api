# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create job
Job.create!(
  company: Faker::Company.name,
  url: Faker::Internet.url,
  title: Faker::Job.title,
  description: Faker::Lorem.paragraph,
  product: Faker::Company.industry,
  based_in: Faker::Address.city,
  timezones: Faker::Address.time_zone,
  stack: Faker::ProgrammingLanguage.name,
  compensation: Faker::Commerce.price,
  pto: Faker::Lorem.paragraph,
  glassdoor_url: Faker::Internet.url,
  glassdoor_rating: Faker::Number.between(from: 1, to: 50),
  notes: Faker::Lorem.paragraph,
  preference: Faker::Number.between(from: 1, to: 100)
)
