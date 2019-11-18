Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  root "items#index"
  #あとでcorectionをmemberに変える必要あるかも。そうすればurlにidが追加される。
  resources :users do
    member do
      get 'profile'
    end
    collection do
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
    resources :comments, only: [:create, :destroy]
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
    collection do
      get 'item_search'
      get 'category_child', defaults: { format: 'json' }
      get 'category_gchild', defaults: { format: 'json' }
    end
  end
  resources :cards, only: [:index, :new, :create, :destroy] do
    member do
      get 'newbuy'
    end
  end
  resources :shippings, only: [:new, :create, :edit, :update, :destroy] do
    member do
      get 'editbuy'
    end
  end
  resources :brands, only: :index
  resources :categories, only: [:show, :new]
  resources :images, only: :destroy, defaults: { format: 'json' }
end
