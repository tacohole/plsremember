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
    end
  end

  task check_available: [:environment] do
    daily = Daily.new
    available = daily.find_available.length
    if available < 7
      daily.low_message_count.deliver_now
    else
      puts "#{available} unsent messages remaining"
    end
  end
end
