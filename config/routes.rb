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
    post 'auth/login' => 'devise/sessions#create', as: 'user_session'
    delete 'auth/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'
    # patch 'auth/password' => 'passwords#update', as: 'user_password'
    post '/auth/signup' => 'registrations#create', as: nil
    get '/auth/confirmation' => 'devise/confirmations#show', as: 'user_confirmation'
  end

  scope :endpoints, controller: :endpoints do
    authenticate :user do
      get 'private'
    end
    get 'public'
  end

end
