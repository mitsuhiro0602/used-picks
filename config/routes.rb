Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  resources :item do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'
      get 'category_children'
      get 'category_grandchildren'
    end
  end

end
