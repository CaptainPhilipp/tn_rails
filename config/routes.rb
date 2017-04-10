Rails.application.routes.draw do
  resources :railway_stations do
    post :change_position, on: :member
  end

  resources :trains do
    match :search, via: %i(get post), on: :collection
  end

  resources :tickets, only: %i(create show index) do
    get 'new/:train_id/:departure_id/:arrival_id', to: 'tickets#new', on: :collection, as: :new
  end

  resources :routes, :carriages, :routes

  root 'routes#index'
end
