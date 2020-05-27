Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  resources :item do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
  end

end
