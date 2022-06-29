# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'verification_email' do
    let(:user) do
      User.create(
        email: 'test@pleaseremember.com',
        subscribed: true,
        verified: false,
        code: '12345678abcdefgh'
      )
    end
    let(:mail) { UserMailer.with(user: user).verification_email }

    it 'has the expected subject' do
      expect(mail.subject).to eq('Please Remember verification email')
    end

    it 'has a user' do
      expect(mail.to).to eq([user.email])
    end

    it 'has the user code in the URL' do
      expect(mail.body.encoded).to match(user.code)
    end
  end
end
