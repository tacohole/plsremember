# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyMailer, type: :mailer do
  describe 'daily_reminder' do
    let(:message) { Daily.create(message: 'test', sent_date: nil) }
    let(:user) do
      User.create(
        email: 'test@pleaseremember.com',
        subscribed: true,
        verified: true,
        code: '12345678abcdefgh'
      )
    end
    let(:mail) { DailyMailer.with(user: user, daily: message).daily_reminder }

    it 'has a valid subject' do
      date = Date.today.to_formatted_s(:long)
      expect(mail.subject).to eq("Please Remember #{date}")
    end

    it 'has a message' do
      expect(mail.body.encoded).to match('test')
    end

    it 'has a user' do
      expect(mail.to).to eq([user.email])
    end

    it 'has the user unsubscribe url' do
      expect(mail.body.encoded).to match(user.code)
    end
  end
end
