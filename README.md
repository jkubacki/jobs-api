# README

Jobs - a simple app to track job applications

Ruby on Rails API, Next.js frontend

```
# Schema:

Job:
  company: string
  url: string
  title: string
  description: text
  product: string
  based_in: string
  timezones: string
  stack: text
  remote: boolean
  compensation: text
  pto: string
  glassdoor_url: string
  glassdoor_rating: percentage
  notes: text
  preference: percentage

Application
  job: belongs_to
  applied_at: datetime
  cv: boolean
  cover_letter: text
  attachments: Attachment[]
  replies: Reply[]
  interviews: Interview[]
  tasks: Task[]
  offers: Offer[]
  notes: text
  preference: percentage

Attachment
  application: belongs_to
  name: string

Reply:
  application: belongs_to
  received_at: datetime
  body: text
  preference: percentage

Interview:
  application: belongs_to
  date: datetime
  medium: string
  notes: text
  preference: percentage

Task:
  application: belongs_to
  description: text
  deadline: datetime
  status: string
  preference: percentage

Offer:
  application: belongs_to
  sent_at: datetime
  counter_offer: boolean
  body: text
  compensation: text
  pto: text
  notes: text
  preference: percentage
```


