Rails.application.routes.draw do
  root 'users#index'
  post 'users/subscribe'
end
