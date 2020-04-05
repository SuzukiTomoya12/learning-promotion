Rails.application.routes.draw do

  root to: "tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  resources :tops, only: :index do
    collection do
      get :society, to: 'tops#society'
    end
  end



  resources :users, only: [:show] do
    member do
      get :regiter_tag, to: 'tags#register'
    end
  end
  resources :reports, only: [:index, :new, :create]
  resources :tags, only: [:index, :new, :create]


end
