# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
  # it won't send to a user that already exists
  # it will send to a user that doesn't exist
  # it won't allow an invalid email address
  # it won't send without a code
  # it will send with a code
  # a new user is created with verified false
  # a new user is created with subscribed true
  # it can find the user by their code and return their email
  # it will verify the user?
  # it will unsubscribe the user and set the unsubscribe_date to current time
end
