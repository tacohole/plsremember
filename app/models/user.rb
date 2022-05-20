# frozen_string_literal: true

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

  def list_subscribers
    User.where(verified: true, unsubscribed_date: nil)
  end

  def validate_captcha; end
end
