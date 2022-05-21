# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Daily, type: :model do
  context 'before sending' do
    it 'cannot have a sent_date' do
      expect { Daily.create(message: 'hi', sent_date: Date.today) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'after sending' do
    it 'must have a sent_date' do
      daily = Daily.new
      daily.choose_message
      expect(daily.sent_date).not_to eq(nil)
    end
  end
end