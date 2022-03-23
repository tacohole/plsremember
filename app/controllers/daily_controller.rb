class DailyController < ApplicationController
    
    # selects a message from the database for that day
    def choose_message(daily)
        message = Daily.find(daily.date)
        return message
    end

    def validate_link
        # if the message is a hyperlink, somehow check that it returns the right content?
    end

    def generate_user_list
        # pull the list of users who should receive that day's message
    end

end