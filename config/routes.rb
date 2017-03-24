Rails.application.routes.draw do
  get 'routes/new'

  get 'routes/create'

  get 'routes/show'

  get 'routes/edit'

  get 'routes/update'

  get 'routes/destroy'

  resources :railway_stations
  resources :trains
  root 'railway_stations#index'
  
end
