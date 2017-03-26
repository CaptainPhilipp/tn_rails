Rails.application.routes.draw do
  resources :railway_stations
  resources :trains do
    put 'route/:route_id', action: 'change_route', as: 'route'
  end

  resources :routes

  root 'railway_stations#index'
end
