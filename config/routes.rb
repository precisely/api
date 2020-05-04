Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :user,
    path: 'auth',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup' 
    }, 
    controllers: {
      registrations: 'registrations'
    }

end
