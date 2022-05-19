class DailyController < ApplicationController

    def send_message(user, message)
        DailyMailer.with(user: user, daily: message).daily_reminder.deliver_now
    end

    def count_available_messages
        unsent = Daily.where(sent_date: nil)
        return unsent.length
    end
end