Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

end
