# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_subject) do
    described_class.new(
      email: 'test@pleaseremember.io',
      code: '0123456789abcdef'
    )
  end

  let(:invalid_email) do
    described_class.new(
      email: 'invalid.nope',
      code: '0123456789abcdef'
    )
  end

  let(:missing_code) do
    described_class.new(
      email: 'test@pleaseremember.io',
      code: ''
    )
  end

  let(:missing_email) do
    described_class.new(
      email: '',
      code: '0123456789abcdef'
    )
  end


  let(:users) { [subscriber, unverified, unsubscribed] }

  it 'is valid with valid attributes' do
    expect(valid_subject).to be_valid
  end

  context 'invalid record' do
    it 'does not allow an invalid email' do
      expect(invalid_email).to_not be_valid
    end

    it 'does not allow a missing code' do
      expect(missing_code).to_not be_valid
    end

    it 'does not allow a missing email' do
      expect(missing_email).to_not be_valid
    end
  end

  it 'only lists verified subscribers' do
    subscriber = User.create(
      email: 'test1@pleaseremember.io',
      subscribed: true,
      verified: true,
      code: '12345678abcdefgh'
    )
    User.create(
      email: 'test2@pleaseremember.io',
      subscribed: true,
      verified: false,
      code: '12345678abcdefgh'
    )
    User.create(
      email: 'test2@pleaseremember.io',
      subscribed: false,
      verified: true,
      code: '12345678abcdefgh',
      unsubscribed_date: Date.today - 1.day
    )

    user = described_class.new

    expect(user.list_subscribers).to match_array([subscriber])
    expect(user.list_subscribers.length).to eq(1)
  end
end
