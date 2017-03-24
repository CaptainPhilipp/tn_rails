Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes # это имелось в виду? а то мало ли, может вручную каждый
  get    '/routes',         to: 'routes#index'
  get    '/routes/new',     to: 'routes#new'
  post   '/routes',         to: 'routes#create'
  get    '/route/:id',      to: 'routes#show'
  post   '/route/:id/edit', to: 'routes#edit'
  patch  '/route/:id',      to: 'routes#update'
  delete '/route/:id',      to: 'routes#destroy'

  root 'railway_stations#index'

end
