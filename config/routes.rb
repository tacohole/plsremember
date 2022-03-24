Rails.application.routes.draw do
  root 'users#index'
  post 'users/subscribe'
  put 'users/verify'
  put 'users/unsubscribe'

  get 'subscribed', to: 'users#subscribe'
  get 'verified', to: 'users#verify'
end
