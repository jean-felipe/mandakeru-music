Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'events#index'

  resources :events

  namespace :api do
    namespace :v1 do
      resources :artists
      resources :events
      resources :genres
    end
  end
end
