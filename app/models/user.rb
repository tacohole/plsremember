class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            record.errors.add attribute, (options[:message] || 'is not an email' )
        end
    end
end

class User < ApplicationRecord
    validates :email, presence: true, email: true 

    def list_subscribers
      subscribers = User.where(verified: true, unsubscribed_date: nil)
      return subscribers
    end

    def validate_captcha
      
    end
end
