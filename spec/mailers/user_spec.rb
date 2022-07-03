# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'verification_email' do
    let(:user) do
      User.create(
        email: 'test@pleaseremember.io',
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

    it 'has the verification link' do
      expect(mail.body.encoded).to include("verify/#{user.code}")
    end

    it 'has an unsubscribe link' do
      expect(mail.body.encoded).to include("unsubscribe/#{user.code}")
    end
  end
end
