Rails.application.routes.draw do

  root to: "tops#index"
  devise_for :users
  resources :reports, only: [:index, :new, :create]
  resources :users, only: [:show]
end
