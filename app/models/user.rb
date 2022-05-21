# frozen_string_literal: true

require 'net/http'

# class EmailValidator validates user emails before creating a new user
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ URI::MailTo::EMAIL_REGEXP
      record.errors.add attribute, (options[:message] || 'is not an email')
    end
  end
end

# class User models users who subscribe
class User < ApplicationRecord
  validates :email, presence: true, email: true

  GOOGLE_URL = URI('https://www.google.com/recaptcha/api/siteverify')

  def list_subscribers
    User.where(verified: true, unsubscribed_date: nil)
  end

  def validate_captcha(captcha)
    https = Net::HTTP.new(GOOGLE_URL.host, GOOGLE_URL.port)
    https.use_ssl = true
    verify_request = Net::HTTP::Post.new(GOOGLE_URL.path)
    verify_request.set_form_data(
      'secret' => ENV['REACT_APP_SECRET_KEY'],
      'response' => captcha
    )
    googleanswer = https.request(verify_request)
    body = JSON.parse(googleanswer.body)
    body['success']
  end
end
