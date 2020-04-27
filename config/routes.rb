Rails.application.routes.draw do
  devise_for :user
  resources :users
  root to: "home#index"
  post 'login', controller: 'login'
  post 'logout', controller: 'login'
  post 'signup', controller: 'login'
  post 'reset_password', controller: 'login'

  get 'public', controller: 'public'
  get 'private', controller: 'private'
  get 'lab', controller: 'private'
  get 'random', controller: 'private'
  get 'admin', controller: 'private'
end
