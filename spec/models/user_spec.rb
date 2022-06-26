# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_subject) do
    described_class.new(
      email: 'test@pleaseremember.com',
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
      email: 'test@pleaseremember.com',
      code: ''
    )
  end

  let(:missing_email) do
    described_class.new(
      email: '',
      code: '0123456789abcdef'
    )
  end

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
end
