Rails.application.routes.draw do
  root 'homes#top'

  get 'search' => 'homes#search'
  get 'index' => 'homes#index'

  devise_for :users

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    member do
      get :likes_index
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :time_line
    end
  end

end
