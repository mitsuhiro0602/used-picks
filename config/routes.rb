Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  resources :item do
    collection do
      get 'step1'
      post 'step1' => 'item#save_step1_to_session'
      get 'step2'
      post 'step2' => 'item#save_step2_to_session'
      get 'step3'
      post 'step3' => 'item#save_step3_to_session'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
  end

end
