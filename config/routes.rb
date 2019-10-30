Rails.application.routes.draw do
  devise_for :users
  #あとでcorectionをmemberに変える必要あるかも。そうすればurlにidが追加される。
  resources :users do
    collection do
      get 'profile'
      get 'intro'
      get 'listing'
      get 'progress'
      get 'completed'
      get 'purchase'
      get 'purchased'
      get 'logout'
      get 'phone'
    end
  end
  resources :items do
    collection do
      get 'buy'
    end
  end
  #usersとネストするかもしれない
  resources :cards, only: [:new, :create, :edit, :update, :destroy]
  resources :shippings, only: [:new, :create, :edit, :update, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :reviews, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  #itemsとネストするかもしれない
  resources :brands, only: :index
  resources :categories, only: :index
  root 'items#buy'
end
