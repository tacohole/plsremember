# frozen_string_literal: true

# class Daily models the message that is sent to subscribers each day
class Daily < ApplicationRecord
  def choose_message
    available = Daily.where(sent_date: nil)
    message = Daily.find(available.pluck(:id).sample)
    message.update!(sent_date: Time.current)
  end

  def send_message(user, message)
    DailyMailer.with(user: user, daily: message).daily_reminder.deliver_now
  end

  def count_available_messages
    unsent = Daily.where(sent_date: nil)
    unsent.length
  end
end
