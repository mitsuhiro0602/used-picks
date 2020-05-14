Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  resources :item do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'
    end
  end

end
