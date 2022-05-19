# lib/tasks/daily.rake
namespace :daily do
    desc 'handling daily message send'

    task :send_messages => [ :environment ] do
        user = User.new
        daily = Daily.new

        users = user.list_subscribers
        message = daily.choose_message

        for user in users do
            message.send_message(user, message)
            puts "sending to #{user}"
        end
    end

    task :check_available do
        available = Daily.count_available_messages
        if available < 7
           daily.low_message_count.deliver_now
        end
    end
end