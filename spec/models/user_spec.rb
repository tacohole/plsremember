# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }
  it 'is valid with valid attributes' do
    subject.email = 'test@pleaseremember.com'
    subject.code = '0123456789abcdef'

    expect(subject).to be_valid
  end

  context 'valid email' do
    it 'allows a valid email' do
      email = 'troy.coll@gmail.com'

      valid = User.create(email: email)

      expect(valid).to be_valid
    end
  end

  context 'invalid email' do
    it 'does not allow an invalid email' do
      subject.email = 'abcdef'

      expect(subject).to_not be_valid
    end
  end

  # it validates emails
  # it lists the subscribers

  # the subscriber list does not include unsubscribed or unverified users
  # it validates the captcha
end
