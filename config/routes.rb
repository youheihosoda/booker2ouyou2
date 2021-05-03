Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
   get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:new, :create, :index, :show, :edit, :update, :destroy]do
  resources :post_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
end