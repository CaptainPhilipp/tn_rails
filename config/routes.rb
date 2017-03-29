Rails.application.routes.draw do
  resources :railway_stations
  resources :routes
  resources :trains
  resources :carriages
  # resources :carriages

  root 'railway_stations#index'
end
