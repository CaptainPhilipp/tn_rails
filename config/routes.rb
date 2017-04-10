Rails.application.routes.draw do
  resources :railway_stations do
    post :change_position, on: :member
  end

  resources :trains, :carriages, :routes do
    get :new_ticket, to: 'tickets#new', on: :member
  end

  resources :tickets, only: %i(new create show index)

  resources :routes
  match :search, to: 'trains#search', via: %i(get post)

  root 'routes#index'
end
