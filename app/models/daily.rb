# frozen_string_literal: true

# class Daily models the message that is sent to subscribers each day
class Daily < ApplicationRecord
  validates :message, presence: true

  def choose_message
    available = find_available
    message = Daily.find(available.pluck(:id).sample)
    message.update!(sent_date: Time.current)
    message
  end

  def find_available
    Daily.where(sent_date: nil)
  end

  def send_message(user, message)
    DailyMailer.with(user: user, daily: message).daily_reminder.deliver_now
  end
end
