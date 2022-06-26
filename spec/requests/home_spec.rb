# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'will GET /index' do
    get '/'
    expect(response).to render_template(:index)
  end

  it 'will GET /subscribed' do
    get '/subscribed'
    expect(response).to render_template(:subscribed)
  end

  it 'will GET /verified' do
    get '/verified'
    expect(response).to render_template(:verified)
  end

  it 'will GET /unsubscribed' do
    get '/unsubscribed'
    expect(response).to render_template(:unsubscribed)
  end

  it 'will GET /about' do
    get '/about'
    expect(response).to render_template(:about)
  end
end
