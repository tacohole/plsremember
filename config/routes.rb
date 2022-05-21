# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/subscribed', to: 'home#subscribed'
  get '/verified', to: 'home#verified'
  get '/unsubscribed', to: 'home#unsubscribed'
  get '/about', to: 'home#about'

  post 'users/subscribe', to: 'users#subscribe'
  get '/verify/:code', to: 'users#verify'
  get '/unsubscribe/:code', to: 'users#unsubscribe'
end
