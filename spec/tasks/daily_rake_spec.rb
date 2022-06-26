# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'send_messages' do
  # it goes to verified subscribers
  # it does not go to unverified users
  # it does not go to unsubscribed users
  # it does not choose a message that's already been sent
end

describe 'check_available' do
  # it sends a message when the message count gets low
  # it does not send a message before the message count gets low
end
