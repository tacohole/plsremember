class DailyController < ApplicationController
    
    # selects a random message from the database for that day
    def choose_message
        available = Daily.where(sent_date: nil)
        message = Daily.find(available.pluck(:id).sample)
        message.update!(sent_date: Time.current)
        return message
    end

    def send_message(user, message)
        DailyMailer.with(user: user, daily: message).daily_reminder.deliver_now
    end

    def count_available_messages
        unsent = Daily.where(sent_date: nil)
        return unsent.length
    end
end