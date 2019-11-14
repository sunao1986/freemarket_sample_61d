Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  root "items#index"
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
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
    collection do
      get 'category_child', defaults: { format: 'json' }
      get 'category_gchild', defaults: { format: 'json' }
    end
  end
  resources :cards, only: [:index, :new, :create, :destroy] do
  end
  #usersとネストするかもしれない
  resources :shippings, only: [:new, :create, :edit, :update, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :reviews, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  #itemsとネストするかもしれない
  resources :brands, only: :index
  resources :categories, only: :index
end
