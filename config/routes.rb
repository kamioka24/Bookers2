Rails.application.routes.draw do
  get 'home/about' #要確認
  get '/' => 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_books
  resources :users
end