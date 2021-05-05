Rails.application.routes.draw do
  get 'searchs/search'
  devise_for :users
   root to: 'homes#top'
   get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]do
    member do
     get :following, :followers
    end
  end
  resources :books,only: [:new, :create, :index, :show, :edit, :update, :destroy]do
  resources :post_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get '/search', to: 'searchs#search'
end