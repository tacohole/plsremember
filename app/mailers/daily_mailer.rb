class DailyMailer < ApplicationMailer
    default from: 'troy@plsremember.com'

    def daily_reminder
      @user = params[:user]
      @daily = params[:daily]
      @unsubscribe_url = "#{ENV['HOST']}/unsubscribe/#{@user.code}"
      mail(to: @user.email, subject: "please remember #{@daily.date}")
    end
end
