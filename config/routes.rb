Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'usser/registrations'
  }
  root "top#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
