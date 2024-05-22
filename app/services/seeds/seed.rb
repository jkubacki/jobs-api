module Seeds
  class Seed < ApplicationService # rubocop:disable Metrics/ClassLength
    def call # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      Listing.create!(
        company: "Facebook",
        url: "https://www.facebook.com/careers/",
        title: "Senior Software Engineer",
        description: "Make Facebook work better, instead of promoting fake news",
        product: "Social Network",
        based_in: "Menlo Park, CA",
        timezones: "PST. American hours.",
        stack: "php, react, graphql",
        compensation: "300k base",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Facebook-EI_IE40772.11,19.htm",
        glassdoor_rating: 41,
        remote: false,
        preference: 70
      )

      Listing.create!(
        company: "Theranos",
        url: "https://www.theranos.com/",
        title: "Senior Medical Engineer",
        description: "Revolutionize the medical industry. Lie to shareholders.",
        product: "Blood Test",
        based_in: "Palo Alto, CA",
        timezones: "PST. American hours.",
        stack: "python, c++, java",
        compensation: "100k base, not paying employees on time",
        pto: "No PTO",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Theranos-EI_IE1406479.11,19.htm",
        glassdoor_rating: 10,
        remote: false,
        preference: 1
      )

      Listing.create!(
        company: "WeWork",
        url: "https://www.wework.com/",
        title: "Staff Software Engineer",
        description: "Make WeWork work better, instead of promoting empty spaces",
        product: "Office Space",
        based_in: "New York, NY",
        timezones: "EST. American hours.",
        stack: "ruby, react, graphql",
        compensation: "150k base",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-WeWork-EI_IE661448.11,17.htm",
        glassdoor_rating: 30,
        remote: false,
        preference: 15
      )

      Listing.create!(
        company: "TikTok",
        url: "https://www.tiktok.com/",
        title: "Lead Software Engineer",
        description: "TikTok is the leading destination for short-form mobile video. Make it more addictive.",
        product: "Social Network",
        based_in: "Los Angeles, CA",
        timezones: "PST. American hours.",
        stack: "python, react, graphql",
        compensation: "220k base, yearly bonus 20k, stock options 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-TikTok-EI_IE1943473.11,17.htm",
        glassdoor_rating: 40,
        remote: false,
        preference: 60
      )

      Listing.create!(
        company: "Amazon",
        url: "https://www.amazon.jobs/",
        title: "Cloud Staff Software Engineer",
        description: "AWS cloud reliability. Make sure the cloud doesn't go down.",
        product: "E-commerce",
        based_in: "Seattle, WA",
        timezones: "PST. American hours.",
        stack: "java, react, graphql",
        compensation: "250k base, yearly bonus 20k, stock options 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Amazon-EI_IE6036.11,17.htm",
        glassdoor_rating: 42,
        remote: false,
        preference: 70
      )

      spacex = Listing.create!(
        company: "SpaceX",
        url: "https://www.spacex.com/careers",
        title: "Senior Software Engineer - Starlink",
        description: "Develop the future of satellite internet.",
        product: "Space",
        based_in: "Hawthorne, CA",
        timezones: "PST. American hours.",
        stack: "python, react, graphql",
        compensation: "300k base",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-SpaceX-EI_IE40371.11,17.htm",
        glassdoor_rating: 42,
        remote: false,
        preference: 70
      )

      Application.create!(
        listing: spacex,
        applied_at: 10.days.ago,
        cv: true,
        cover_letter: "I go space. I like space. I want to work in space.",
        notes: "I dm'd Elon on Twitter. I hope he sees it.",
        preference: 75
      )

      Listing.create!(
        company: "Slack",
        url: "https://slack.com/careers",
        title: "Lead Software Engineer",
        description: "Productivity features for Slack.",
        product: "Communication",
        based_in: "San Francisco, CA",
        timezones: "PST. American hours.",
        stack: "node, react, graphql",
        compensation: "200k base, yearly bonus 20k, stock options 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Slack-EI_IE1030444.11,16.htm",
        glassdoor_rating: 38,
        remote: true,
        preference: 45,
        notes: "I'm not sure about Slack. I use it every day, but I'm not sure if I want to work there."
      )

      Listing.create!(
        company: "Microsoft",
        url: "https://careers.microsoft.com/",
        title: "Staff Software Architect",
        description: "Develop Windows kernel in Linux.",
        product: "Windows 12",
        based_in: "Redmond, WA",
        timezones: "PST. American hours.",
        stack: "c#, .net, unix",
        compensation: "250k base, stock options 50k, sign-on bonus 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Microsoft-EI_IE1651.11,20.htm",
        glassdoor_rating: 32,
        remote: false,
        preference: 50,
        notes: "I want to hate Microsoft. But I use VSCode and typescript."
      )

      Listing.create!(
        company: "Apple",
        url: "https://www.apple.com/jobs/",
        title: "Senior Software Engineer",
        description: "Develop iOS and macOS applications.",
        product: "Hardware",
        based_in: "Cupertino, CA",
        timezones: "PST. American hours.",
        stack: "swift, react, graphql",
        compensation: "400k base",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Apple-EI_IE1138.11,16.htm",
        glassdoor_rating: 42,
        remote: false,
        preference: 70
      )

      Listing.create!(
        company: "Tesla",
        url: "https://www.tesla.com/careers",
        title: "Senior Software Engineer - Autopilot",
        description: "Develop the future of self-driving cars.",
        product: "Electric Cars",
        based_in: "Palo Alto, CA",
        timezones: "PST. American hours.",
        stack: "python, react, graphql",
        compensation: "200k base, yearly bonus 20k, stock options 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Tesla-EI_IE43129.11,16.htm",
        glassdoor_rating: 42,
        remote: false,
        preference: 70
      )

      Listing.create!(
        company: "Netflix",
        url: "https://jobs.netflix.com/",
        title: "Principal Software Developer",
        description: "Make Netflix promote better content",
        product: "Recommendation Engine",
        based_in: "Los Gatos, CA",
        timezones: "PST. American hours.",
        stack: "typescript, nodejs, react",
        compensation: "240k base, yearly bonus 20k, stock options 50k",
        pto: "No PTO",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-Netflix-EI_IE11891.11,18.htm",
        glassdoor_rating: 41,
        remote: false,
        preference: 60
      )

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
        compensation: "200-300k USD stock options 50k, sign-on bonus 50k",
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

      github = Listing.create!(
        company: "GitHub",
        url: "https://github.com/careers",
        title: "Senior Engineering Manager",
        description: "Lead a team of engineers to build the future of software development.",
        product: "Software Development",
        based_in: "San Francisco, CA",
        timezones: "PST. American hours.",
        stack: "ruby, react, graphql",
        compensation: "200k base, yearly bonus 20k, stock options 50k",
        pto: "4 weeks",
        glassdoor_url: "https://www.glassdoor.com/Overview/Working-at-GitHub-EI_IE644786.11,17.htm",
        glassdoor_rating: 42,
        remote: true,
        preference: 90,
        notes: "I love GitHub. I use it every day."
      )

      Application.create!(
        listing: github,
        applied_at: 1.day.ago,
        cv: true,
        cover_letter: "",
        notes: "I've sent application for the Authentication team. I'd prefer Solutions",
        preference: 50
      )

      Application.create!(
        listing: github,
        applied_at: 1.day.ago,
        cv: true,
        cover_letter: "I'm a great fit for this role. I'm excited to bring new features to GitHub.",
        notes: "Solutions team. This looks very good.",
        preference: 90
      )
    end
  end
end
