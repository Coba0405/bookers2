Rails.application.routes.draw do
  # get 'users/index' => 'users#index'
  # get 'users/show' => 'users#show'
  # get 'users/edit' => 'users#edit'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'homes/index' => 'homes#index'
  # get 'homes/show' => 'homes#show'
  # get 'homes/edit' => 'homes#edit'
  
    devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about",as:"about"
  resources :users
  # resources :homes
  resources :books
  # root to: 'homes#top'
  # get 'home/about' => "homes#about",as:"about"
  # get 'user/home' => "users#home",as:"home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
