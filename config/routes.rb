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
      post :register, defaults: { format: 'json' }
      get :learning, to: 'users#learning'
    end
  end
  resources :reports, only: [:index, :new, :create, :show]
  resources :tags, only: [:index] do
    collection do
      get :search, to: 'tags#search'
    end
  end


end
