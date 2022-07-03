# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @code = '12345678abcdefgh'
    allow_any_instance_of(User).to receive(:code).and_return(@code)
  end

  it 'will POST to users/subscribe' do
    post '/users/subscribe', params: { email: 'validemail@pleaseremember.io' }
    expect(response).to have_http_status(:ok)
  end

  it 'will GET verify/:code' do
    get "/verify/#{@code}"
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(:verified)
  end

  it 'will GET unsubscribe/:code' do
    get "/unsubscribe/#{@code}"
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(:unsubscribed)
  end

  it 'will GET /subscribed' do
    get '/subscribed'
    expect(response).to render_template(:subscribed)
  end

  it 'will GET /verified' do
    get '/verified'
    expect(response).to render_template(:verified)
  end
end
