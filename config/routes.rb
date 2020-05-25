Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	member do # memberメゾットを使うとユーザーidが含まれているURLを扱うようになる。
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
end