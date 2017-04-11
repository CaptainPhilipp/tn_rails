Rails.application.routes.draw do
  resources :routes, :carriages, :routes, :trains

  resources :railway_stations do
    post :change_position, on: :member
  end

  resources :tickets, only: %i(create show index) do
    get 'new/:train_id/:departure_id/:arrival_id', to: 'tickets#new', on: :collection, as: :new
  end

  namespace :searches do
    match :trains, via: %i(get post), action: :trains_by_terminal_stations
  end

  root 'static_pages#index'
end
