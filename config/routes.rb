Rails.application.routes.draw do
  # ユーザー用デバイス
# URL /customers/sign_in ...
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用デバイス
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
#ゲストログイン用
devise_scope :user do
    post "users/guest_sign_in", to: "public/users/sessions#guest_sign_in"
  end

get "search" => "searches#search"

#管理者
namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

#ユーザー
scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get :withdraw_confirm
      patch :withdraw
    end
    member do
      get :favorites
      get :follows, :followers
      get :timelines
    end
    resource :relationships, only: [:create, :destroy]
    end
    resources :posts, only: [:new, :create, :index, :edit, :update, :destroy, :show] do
      resource :post_favorite, only: [:create, :destroy]
      resources :comments, only: [:create,:destroy]
      collection do
          get :search_tag
      end
    end
    resources :notifications, only: [:index, :destroy]
  end
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
