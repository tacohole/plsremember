Rails.application.routes.draw do
  root 'home#index'
  get '/subscribed', to: 'home#subscribed'
  get '/verified', to: 'home#verified'
  get '/unsubscribed', to: 'home#unsubscribed'

  post 'users/subscribe', to: 'users#subscribe'
  put 'users/verify', to: 'users#verify'
  put 'users/unsubscribe', to: 'users#unsubscribe'

end
