# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Daily, type: :model do
  before do
    @daily = Daily.new
    @message = Daily.create(message: 'test', sent_date: nil)
    @unsent_messages = 6.times do
      Daily.create(message: 'test', sent_date: nil)
    end
    @sent_messages = 3.times do
      Daily.create(message: 'test', sent_date: Date.today)
    end
    @user = double('user')
    allow(@user).to receive(:email) { 'troy.coll@gmail.com' }
    allow(@user).to receive(:code) { nil }
  end

  context 'before sending' do
    it 'should not have a sent_date' do
      sample = @daily.choose_message
      expect(sample[:sent_date]).to eq(nil)
    end
  end

  context 'when choosing a message' do
    it 'returns a single message' do
      message = @daily.choose_message
      expect(message).to be_a(Daily)
    end
  end

  context 'after sending' do
    it 'must have a sent_date' do
      @daily.send_message(@user, @message)
      expect(@message[:sent_date]).not_to eq(nil)
    end
  end

  context 'finding available' do
    it 'returns an accurate count of available' do
      count = @daily.find_available
      expect(count.length).to eq(7)
    end
  end
end
