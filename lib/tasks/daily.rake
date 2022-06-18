# frozen_string_literal: true

# lib/tasks/daily.rake
namespace :daily do
  desc 'handling daily message send'
  task send_messages: [:environment] do
    user = User.new
    daily = Daily.new

    users = user.list_subscribers
    message = daily.choose_message

    users.each do |u|
      message.send_message(u, message)
      logger.info("sending to #{u}")
    end
  end

  task :check_available do
    available = Daily.find_available.length
    if available < 7
      daily.low_message_count.deliver_now
    else
      logger.info("#{available} unsent messages remaining")
    end
  end
end
