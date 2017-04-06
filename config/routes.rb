Rails.application.routes.draw do
  resources :trains, :carriages, :routes
  resources :railway_stations do
    post :change_position, on: :member
  end
  root 'railway_stations#index'
end
