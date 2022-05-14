# lib/tasks/daily.rake

namespace :daily do
    desc 'handling daily message send'

    task :send_messages do
        users = User.list_subscribers
        message = Daily.choose_message

        for user in users do
            message.send_message(user)
        end
    end
end