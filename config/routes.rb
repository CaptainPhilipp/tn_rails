Rails.application.routes.draw do
  resources :railway_stations, :routes, :trains, :carriages

  root 'railway_stations#index'
end
