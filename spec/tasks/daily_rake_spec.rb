# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'send_messages' do
  after(:each) do
    Rake::Task['daily:send_messages'].reenable
  end
end

describe 'check_available' do
  # it sends a message when the message count gets low
  # it does not send a message before the message count gets low
end
