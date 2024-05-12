# Google listing application seed data. True story.

listing = Listing.create!(
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
  listing:,
  applied_at: 2.days.ago,
  cv: true,
  cover_letter: "I'm a great fit for this role. I've worked on search engines before.",
  notes: "I've sent it both through the website and to the hiring manager. The process was confusing.",
  preference: 50
)

Reply.create!(
  application:,
  sent_at: 50.hours.ago,
  body: "Thank you for your application. We'll get back to you soon.",
  notes: "Automatic reply. Not sure if they'll get back to me.",
  preference: 25
)

Reply.create!(
  application:,
  sent_at: 49.hours.ago,
  body: "Do you want to work in the office? We have snacks. Private life is overrated.",
  preference: 75
)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 48.hours.ago,
  body: "Nah, I'm good. I prefer to work remotely."
)

interview_reply = Reply.create!(
  application:,
  sent_at: 47.hours.ago,
  body: "Are you available tomorrow at 10am? We'd like you to leetcode some problems that have nothing to do with the work. Let's talk on google meet.", # rubocop:disable Layout/LineLength
  notes: "Ok, i guess.",
  preference: 20
)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 46.hours.ago,
  body: "Sure, let's meet tomorrow at 10am. I'll be there."
)

interview = Interview.create!(
  reply: interview_reply,
  scheduled_at: 24.hours.ago,
  medium: "Google Meet"
)

interview.update!(
  notes: "I was asked to traverse a binary tree. I don't think that's important for the job.",
  preference: 10
)

Reply.create!(
  application:,
  sent_at: 18.hours.ago,
  body: "You were right on the call. Traversing binary tree is not that important. You'll get an email to do a small task.",
  preference: 70
)

task_reply = Reply.create!(
  application:,
  sent_at: 17.hours.ago,
  body: "Complete this small task. We'd like for you to build a better google for us. You have one hour.",
  preference: 20
)

task = Task.create!(
  reply: task_reply,
  due_at: 16.hours.ago,
  notes: "Wow",
  preference: 10
)

task.update!(notes: "Just add site:reddit.com to every search query. Done.", done: true)

Reply.create!(
  application:,
  by_me: true,
  sent_at: 15.hours.ago,
  body: "This is done. I added site:reddit.com to the search query. Now you can find relevant information."
)

offer_reply = Reply.create!(
  application:,
  sent_at: 10.hours.ago,
  body: "We are impressed. We'd like to offer you the listing. 200k USD vesting stock options 50k, sign-on bonus 50k.",
  notes: "Duh.",
  preference: 90
)

Offer.create!(
  reply: offer_reply,
  compensation: "200k USD vesting stock options 50k, sign-on bonus 50k",
  pto: "Unlimited PTO",
  notes: "They are lowballing me. I'll ask for 300k.",
  preference: 85
)

counter_offer_reply = Reply.create!(
  application:,
  sent_at: 9.hours.ago,
  by_me: true,
  body: "I'd like to discuss the compensation. I'd like to ask for 300k."
)

final_offer = Offer.create!(
  reply: counter_offer_reply,
  by_me: true,
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

final_offer.update!(accepted: true)

# Another listing
Listing.create!(
  company: "Netflix",
  url: "https://jobs.netflix.com/",
  title: "Principal Software Developer",
  description: "Make Netflix promote better content",
  product: "Recommendation Engine",
  based_in: "Los Gatos, CA",
  timezones: "PST. American hours.",
  stack: "typescript, nodejs, react",
  compensation: "200k base",
  pto: "No PTO",
  glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Netflix-EI_IE11891.11,18.htm",
  glassdoor_rating: 41,
  remote: false,
  preference: 60
)
