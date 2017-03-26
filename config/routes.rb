Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes

  root 'railway_stations#index'
end
