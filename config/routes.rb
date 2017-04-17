Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/, defaults: { locale: I18n.default_locale } do
    namespace :admin do
      resources :tickets
    end
    devise_for :users

    namespace :admin do
      resources :routes, :carriages

      resources :trains do
        resources :carriages
      end

      resources :railway_stations do
        post :change_position, on: :member
      end

      get '', controller: :base, action: :index
    end

    resources :tickets, only: %i(index create show destroy) do
      get 'new/:train_id/:departure_id/:arrival_id', to: 'tickets#new', on: :collection, as: :new
    end

    resources :search, only: %i(new index) do
      post :new, action: :find, on: :new
    end
    root 'static_pages#home'
  end

  get '/', to: 'static_pages#home'
end
