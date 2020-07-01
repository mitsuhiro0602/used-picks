Rails.application.routes.draw do

  get 'mypage/index'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'

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
  end

  #投稿ページの表示
  resources :posts do
  end

  #fullcalendarのapi記述
  # namespace :api, { format: 'json'} do
  #   namespace :v1 do
  #     resources :events
  #   end
  # end
end
