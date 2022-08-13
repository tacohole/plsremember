# [Please Remember](https://www.pleaseremember.io)

## What?

A Ruby on Rails app with a React front-end. It:

- allows users to subscribe with their email address
- send a verification email to the potential subscriber
- subscribed and verified users receive a brief (tweet-length) message via email

## Setup

### Pre-reqs

- Ruby
- Node 14
- PostgreSQL 11+
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)

### Installation

- `gh repo clone tacohole/plsremember && cd plsremember`
- `cp .env.sample > .env.development`
- Fill in all config vars in `.env.development`
- Ensure Postgres is running locally and accepting connections, or point the `DATABASE_URL` to your database
- `rails bin/setup`
- Make sure the tests pass with `bundle exec rake spec`
- `heroku local -p 3000`
- `open localhost:3000`

## Operation

- The app uses two Rake tasks for daily administration:
  - `daily:send_messages` selects an arbitrary message from the database and sends it via email to all verified subscribers in the `users` table. It then marks that message as sent, with the day's date.
  - `daily:check_available` counts the number of unsent messages in the database. If there are less than 7 messages that have never been sent, the task sends an email to the contact in `ADMIN_EMAIL`.
  - The frequency of each of these jobs can be configured via a cron or custom clock process. In production, the app uses the Heroku Scheduler to trigger these tasks.
- Seeding the database with messages:
  - `rails db:seed` will look in the `db/data` directory for a named CSV file to load into the database. The headers on the CSV must match the column names on the `dailies` table.
