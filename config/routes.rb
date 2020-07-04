Rails.application.routes.draw do

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :events
    end
  end

  get 'mypage/index'

  # カレンダーの作成
  resources :events, only: [:index]

  devise_for :users
  root "item#index"

  # ユーザーの詳細ページを作成
  resources :users, only: [:index, :show]

  #  アイテムページの作成
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
    # いいねの作成
    resources :likes, only: [:create, :destroy]
    # コメントの作成
    resources :comments, only: [:create, :destroy]

    # インクリメンタルサーチを実装する
    collection do
      get 'search'
    end
  end

  #投稿ページの表示
  resources :posts do
  end

  # グラフの作成
  resources :chart do
    collection do
      post 'chart/show_total', to: 'chart#show_total'
      # post 'chart/show_week', to: 'charts#show_week'
      post 'chart/show_month(/:name)', to: 'chart#show_month'
      # post 'chart/show_year(/:name)', to: 'charts#show_year'
    end
  end
end
