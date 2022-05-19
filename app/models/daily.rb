class Daily < ApplicationRecord
  def choose_message
    available = Daily.where(sent_date: nil)
    message = Daily.find(available.pluck(:id).sample)
    message.update!(sent_date: Time.current)
    return message
  end

end
