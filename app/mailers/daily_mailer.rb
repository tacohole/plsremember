# frozen_string_literal: true

# class DailyMailer sends the daily email to subscribers, and admin emails to admin
class DailyMailer < ApplicationMailer
  default from: 'troy@pleaseremember.com'

  def daily_reminder
    date = Date.today.to_formatted_s(:long)

    @user = params[:user]
    @daily = params[:daily]
    @unsubscribe_url = "#{ENV['HOST']}/unsubscribe/#{@user.code}"
    mail(to: @user.email, subject: "Please Remember #{date}")
  end

  def low_message_count
    @daily = params[:daily]
    @message_count = daily.find_available.length
    mail(to: ENV['ADMIN_EMAIL'], subject: 'refill please remember messages!')
  end
end
