Rails.application.routes.draw do

  # XXX: Note this disables all auto-generated Devise routes. This is to prevent
  # Devise from creating endpoints unused in API mode. Routes are explicitly
  # created below in devise_scope.
  devise_for :users,
    path: 'auth',
    skip: [:session, :password, :registration, :confirmation, :unlocks],
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      registrations: 'registrations',
      passwords: 'passwords'
    }
  devise_scope :user do
    # login
    post 'auth/login' => 'devise/sessions#create', as: 'user_session'
    # logout
    delete 'auth/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'
    # ???
    #patch 'auth/password' => 'passwords#update', as: 'user_password'
    # make password reset request
    post '/auth/password' => 'passwords#create', as: nil
    # reset password using token
    put '/auth/password' => 'passwords#update', as: nil
    # signup
    post '/auth/signup' => 'registrations#create', as: nil
    # confirm signup
    get '/auth/confirmation' => 'devise/confirmations#show', as: 'user_confirmation'
  end

  scope :endpoints, controller: :endpoints do
    authenticate :user do
      get 'private'
      match 'pia/*path' => 'pia#proxy', via: :all
    end
    get 'public'
  end

end
