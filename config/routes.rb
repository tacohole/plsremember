Rails.application.routes.draw do
  root 'users#index'
  post 'users/subscribe'
  put 'users/verify'
  put 'users/unsubscribe'

  get 'subscribed'
  get 'verified'
end
