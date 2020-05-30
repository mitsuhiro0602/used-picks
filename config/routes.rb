Rails.application.routes.draw do
  devise_for :users
  root "item#index"

  # root 'items#index'
  resources :item do
  # Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
    collection do
      get ':id/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get ':id/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  get 'posts', to: 'posts#index'

  #投稿ページの作成
  get 'posts/new', to: 'posts#new'

end
