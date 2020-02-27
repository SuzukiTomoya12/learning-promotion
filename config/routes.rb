Rails.application.routes.draw do

  root to: "tops#index"
  devise_for :users

  resources :users, only: [:show]
  resources :reports, only: [:index, :new, :create]
  resources :tags, only: [:index, :new, :create]

end
