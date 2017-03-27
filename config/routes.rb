Rails.application.routes.draw do
  resources :railway_stations
  resources :routes
  resources :trains
  resources :carriages, except: :index

  root 'railway_stations#index'
end
