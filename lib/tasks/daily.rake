# lib/tasks/daily.rake

namespace :daily do
    desc 'handling daily message send'

    task :send_messages do
        @user = User.new
        @daily = Daily.new
        users = user.list_subscribers
        message = daily.choose_message

        for user in users do
            message.send_message(user)
        end
    end

    task :check_available do
        daily = Daily.new
        available = daily.count_available_messages
        if available < 7
           daily.low_message_count.deliver_now
        end
    end
end