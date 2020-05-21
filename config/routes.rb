Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  resources :item, only: [:index, :create] do
    collection do
      get 'step1'
      post 'step1' => 'item#step1_validation'
      get 'step2'
      post 'step2' => 'item#step2_validation'
      get 'step3'
      post 'step3' => 'item#step3_calidation'
      get 'category_children'
      get 'category_grandchildren'
    end
  end

end
