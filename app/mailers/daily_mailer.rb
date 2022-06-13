# frozen_string_literal: true

# class DailyMailer sends the daily email to subscribers, and admin emails to admin
class DailyMailer < ApplicationMailer
  default from: 'troy@plsremember.com'

  def daily_reminder
    @user = params[:user]
    @daily = params[:daily]
    @unsubscribe_url = "#{ENV['HOST']}/unsubscribe/#{@user.code}"
    mail(to: @user.email, subject: "please remember #{Date.today}")
  end

  def low_message_count
    @daily = params[:daily]
    @message_count = daily.count_available_messages
    mail(to: ENV['ADMIN_EMAIL'], subject: 'refill pls remember messages!')
  end
end
