class DailyMailer < ApplicationMailer
    default from: 'troy@plsremember.com'

    def daily_reminder
      @user = params[:user]
      daily = Daily.new
      @unsubscribe_url = 'https://plsremember.com/unsubscribe'
      mail(to: @user.email, subject: `pls remember #{daily.date}`)
    end
end
