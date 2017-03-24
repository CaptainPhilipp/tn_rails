Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  # resources :routes # это имелось в виду? а то мало ли, может вручную каждый
  get    '/routes',         to: 'routes#index'                  # routes_path          :get
  post   '/routes',         to: 'routes#create'                 # routes_path          :post
  get    '/routes/new',     to: 'routes#new', as: 'new_route'   # new_route_path       :get
  get    '/route/:id/edit', to: 'routes#edit', as: 'edit_route' # edit_route_path(:id) :get
  get    '/route/:id',      to: 'routes#show', as: 'route'      # route_path(:id)      :get
  patch  '/route/:id',      to: 'routes#update'                 # route_path(:id)      :patch
  delete '/route/:id',      to: 'routes#destroy'                # route_path(:id)      :delete


  root 'railway_stations#index'

end
