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
job = Job.create!(
  company: "Google",
  url: "https://careers.google.com",
  title: "Staff Software Engineer",
  description: "Make google work better, instead of promoting content farms",
  product: "Search Engine",
  based_in: "Mountain View, CA",
  timezones: "PST, Europe. Elastic hours.",
  stack: "python, go, java",
  compensation: "200-300k USD vesting stock options 50k, sign-on bonus 50k",
  pto: "Unlimited, usually 4 weeks",
  glassdoor_url: "https://www.glassdoor.es/Resumen/Trabajar-en-Google-EI_IE9079.12,18.htm",
  glassdoor_rating: 43,
  remote: true,
  notes: "No massages :(. Tough times.",
  preference: 85
)

application = Application.create!(
  job:,
  applied_at: 1.day.ago,
  cv: true,
  cover_letter: "I'm a great fit for this role. I've worked on search engines before.",
  notes: "I sent it both through the website and to the hiring manager. The process was confusing.",
  preference: 50
)

Reply.create!(
  application:,
  sent_at: 6.hours.ago,
  body: "Thank you for your application. We'll get back to you soon.",
  notes: "Automatic reply. Not sure if they'll get back to me.",
  preference: 25
)

Reply.create!(
  application:,
  sent_at: 5.hours.ago,
  body: "We have considered your application. Do you want to work in the office?",
  preference: 75
)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 4.hours.ago,
  body: "Nah, I'm good. I prefer to work remotely."
)

Reply.create!(
  application:,
  sent_at: 3.hours.ago,
  body: "No problem. We'll consider you for the role. You'll an email to do a small task for us soon.",
  preference: 70
)

Reply.create!(
  application:,
  sent_at: 2.hours.ago,
  body: "Complete this small task. We'd like for you to build a better google for us. You have one day.",
  preference: 20
)

task = Task.create!(
  application:,
  due_at: 1.day.from_now,
  description: "Build a better google for us. You have one day.",
  notes: "Wow",
  preference: 10
)

task.update!(notes: "Just add site:reddit.com to the search query. Done.", done: true)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 1.hour.ago,
  body: "This is done. I added site:reddit.com to the search query. Now you can find relevant information."
)

Reply.create!(
  application:,
  sent_at: 30.minutes.ago,
  body: "We are impressed. We'd like to offer you the job. Please let us know if you have any questions.",
  notes: "Duh.",
  preference: 90
)

Offer.create!(
  application:,
  sent_at: 30.minutes.ago,
  body: "We'd like to offer you the job. Please let us know if you have any questions.",
  compensation: "200k USD vesting stock options 50k, sign-on bonus 50k",
  pto: "Unlimited PTO",
  notes: "They are lowballing me. I'll ask for 300k.",
  preference: 85
)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 29.minutes.ago,
  body: "I'd like to discuss the compensation. I'd like to ask for 300k."
)

Offer.create!(
  application:,
  by_me: true,
  sent_at: 20.minutes.ago,
  body: "I'd like to discuss the compensation. I'd like to ask for 300k and european PTO",
  compensation: "300k USD vesting stock options 50k, sign-on bonus 50k",
  pto: "26 days",
  notes: "🤞"
)

Reply.create!(
  application:,
  sent_at: 10.minutes.ago,
  body: "We'll fire our CEO if we have to. We'll give you 300k and 26 days of PTO. Welcome to Google.",
  notes: "Nice. I'm in.",
  preference: 100
)
