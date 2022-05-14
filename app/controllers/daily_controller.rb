class DailyController < ApplicationController
    
    # selects a message from the database for that day
    def choose_message(daily)
        message = Daily.find(daily.date)
        return message
    end

    def send_message(user, message)
        DailyMailer.with(user: user, daily: message).daily_reminder.deliver_now
    end
end