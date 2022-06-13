# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyMailer, type: :mailer do
  pending "add some examples to (or delete) #{__FILE__}"
  # daily mailer sends a mail
  # it goes to verified subscribers
  # it does not go to unverified users
  # it does not go to unsubscribed users
  # it does not choose a message that's already been sent
  # it sends a message when the message count gets low
  # it does not send a message before the message count gets low
end
