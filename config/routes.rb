Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :routes, :carriages

    resources :trains do
      resources :carriages
    end

    resources :railway_stations do
      post :change_position, on: :member
    end
  end

  resources :tickets, only: %i(create show index) do
    get 'new/:train_id/:departure_id/:arrival_id', to: 'tickets#new', on: :collection, as: :new
  end

  resources :search, only: :new do
    post :new, action: :find, on: :new
  end

  root 'static_pages#home'
end
