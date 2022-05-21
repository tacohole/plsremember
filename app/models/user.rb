# frozen_string_literal: true

require 'net/http'

# class EmailValidator validates user emails before creating a new user
class EmailValidator < ActiveModel::EachValidator
  EMAIL_PATTERN = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || 'is not an email') if value =~ EMAIL_PATTERN
  end
end

# class User models users who subscribe
class User < ApplicationRecord
  validates :email, presence: true, email: true

  GOOGLE_URL = URI('https://www.google.com/recaptcha/api/siteverify')

  def list_subscribers
    User.where(verified: true, unsubscribed_date: nil)
  end

  def validate_captcha(params)
    https = Net::HTTP.new(GOOGLE_URL.host, GOOGLE_URL.port)
    https.use_ssl = true
    verify_request = Net::HTTP::Post.new(uri.path)
    verify_request.set_form_data(
      'secret' => ENV['REACT_APP_SECRET_KEY'],
      'response' => params['g-recaptcha-response']
    )
    googleanswer = https.request(verify_request)
    JSON.parse(googleanswer.body).dig['success']
  end
end
