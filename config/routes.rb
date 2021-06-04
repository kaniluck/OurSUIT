Rails.application.routes.draw do
  root 'homes#top'

  # ゲストユーザーの為にusersディレクトリと別途コントローラーを作成しました
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # トップページの記述（タグ検索、検索結果）
  get 'search' => 'homes#search'
  get 'index' => 'homes#index'

  # 投稿に関する記述（投稿、コメント、いいね）
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    member do
      get :likes_index
    end
  end

  # ユーザーに関する記述（ユーザー情報、フォロー）
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :time_line
    end
  end

end
