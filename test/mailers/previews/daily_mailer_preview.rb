# Preview all emails at http://localhost:3000/rails/mailers/daily_mailer
class DailyMailerPreview < ActionMailer::Preview
  def daily_reminder
    DailyMailer.with(user: User.first, daily: Daily.first).daily_reminder
  end
end
