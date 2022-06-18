# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Daily, type: :model do
  before do
    @daily = Daily.new
    @message = Daily.create(message: 'test', sent_date: nil)
    @user = double('user')
    allow(@user).to receive(:email) { 'troy.coll@gmail.com' }
    allow(@user).to receive(:code) { nil }
  end

  context 'before sending' do
    it 'should not have a sent_date' do
      expect(@daily.choose_message[:sent_date]).to eq(nil)
    end

    it 'should return the full list of available messages' do
      sent = Daily.where.not(sent_date: nil)
      available = @daily.find_available
      all_messages = Daily.count(:message)

      expect(all_messages).to eq(sent + available)
    end
  end

  context 'when choosing a message' do
    it 'only selects a single message' do
      message = @daily.choose_message
      expect(message.length).to eq(1)
    end
  end

  context 'after sending' do
    # it won't send to an invalid email

    it 'must have a sent_date' do
      message = @daily.send_message(@user, @message)
      expect(message[:sent_date]).not_to eq(nil)
    end
  end
end
