Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end

  resources :users
end