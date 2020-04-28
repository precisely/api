Rails.application.routes.draw do
  root to: "home#index"
  
  namespace :v1 do
    devise_for :users,
      #path: '',
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
       # sessions: 'sessions',
       # registrations: 'registrations'
      }
  end

  get 'public', controller: 'public'
  get 'private', controller: 'private'
  get 'lab', controller: 'private'
  get 'random', controller: 'private'
  get 'admin', controller: 'private'
  
end
