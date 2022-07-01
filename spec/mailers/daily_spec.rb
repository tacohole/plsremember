# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyMailer, type: :mailer do
  describe 'daily_reminder' do
    let(:text_message) do
      Daily.create(
        message: 'a short string',
        media: 'text',
        source: 'an author',
        link: 'https://pleaseremember.io',
        sent_date: nil
      )
    end
    let(:user) do
      User.create(
        email: 'test@pleaseremember.com',
        subscribed: true,
        verified: true,
        code: '12345678abcdefgh'
      )
    end
    let(:mail) { DailyMailer.with(user: user, daily: text_message).daily_reminder }

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

    it 'formats the source as a hyperlink with the link' do
      expect(mail.body.encoded).to include("<a href='#{text_message[:link]}'>#{text_message[:source]}</a>")
    end

    context 'video message' do
      let(:video_message) do
        Daily.create(
          message: 'a link to a video',
          media: 'video',
          source: '',
          link: 'https://pleaseremember.io',
          sent_date: nil
        )
      end

      it 'formats the message as a hyperlink with the link' do
        expect(mail.body.encoded).to include("<a href='#{video_message[:link]}'>#{video_message[:message]}</a>")
      end
    end
  end

  describe 'low_message_count' do
    let(:message) { Daily.create(message: 'test', sent_date: nil) }
    let(:mail) { DailyMailer.with(daily: message).low_message_count }

    it 'sends to the right person' do
      allow(ENV).to receive(:[]).with('ADMIN_EMAIL').and_return('troy.coll@gmail.com')
      expect(mail.to).to eq(['troy.coll@gmail.com'])
    end
  end
end
