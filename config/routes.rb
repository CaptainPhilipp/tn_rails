Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes # это имелось в виду? а то мало ли, может вручную каждый

  root 'railway_stations#index'

end
