Rails.application.routes.draw do
  post 'login', controller: 'login'
  post 'logout', controller: 'logout'

  get 'public', controller: 'public'
  get 'private', controller: 'private'
  get 'lab', controller: 'private'
  get 'random', controller: 'private'
  get 'admin', controller: 'private'
end
