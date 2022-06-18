# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      email: 'test@pleaseremember.com',
      code: '0123456789abcdef'
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'invalid record' do
    it 'does not allow an invalid email' do
      subject.email = 'abcdef'

      expect(subject).to_not be_valid
    end

    it 'does not allow a missing code' do
      subject.code = ''

      expect(subject).to_not be_valid
    end
  end

  # it validates emails
  # it lists the subscribers

  # the subscriber list does not include unsubscribed or unverified users
  # it validates the captcha
end
