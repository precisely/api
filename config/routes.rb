Rails.application.routes.draw do
  get 'public', controller: 'public'
  get 'private', controller: 'private'
  get 'lab', controller: 'private'
  get 'random', controller: 'private'
  get 'admin', controller: 'private'
end
