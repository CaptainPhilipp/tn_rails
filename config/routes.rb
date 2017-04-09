Rails.application.routes.draw do
  resources :routes

  resources :trains, :carriages, :routes do
    get :new_ticket, to: 'tickets#new', on: :member
  end

  resources :railway_stations do
    post :change_position, on: :member
  end

  resources :tickets, only: %i(create show index)

  get  :search, to: 'routes#search'
  post :search, to: 'routes#find'

  root 'routes#index'
end
