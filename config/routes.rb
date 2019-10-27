Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  root 'items#new'
end
