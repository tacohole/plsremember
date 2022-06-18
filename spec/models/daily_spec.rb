# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Daily, type: :model do
  before do
    @daily = Daily.create(message: 'test', sent_date: nil)
  end

  context 'before sending' do
    it 'should not have a sent_date' do # this one is not quite right
      pending ''
    end

    it 'should return the full list of available messages' do
      pending ''
    end
  end

  context 'when choosing a message' do
    it 'only selects a single message' do
      expect(Daily.choose_message).length.to eq(1)
    end
  end

  context 'after sending' do
    it 'must have a sent_date' do
      message = Daily.choose_message
      expect(message.sent_date).not_to eq(nil)
    end
  end
end
