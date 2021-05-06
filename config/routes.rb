Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
