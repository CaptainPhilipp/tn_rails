Rails.application.routes.draw do
  resources :routes, :carriages

  resources :trains do
    resources :carriages
  end

  resources :railway_stations do
    post :change_position, on: :member
  end

  resources :tickets, only: %i(create show index) do
    get 'new/:train_id/:departure_id/:arrival_id', to: 'tickets#new', on: :collection, as: :new
  end

  resources :search, only: :new do
    post :find, on: :new
  end

  root 'static_pages#home'
end
