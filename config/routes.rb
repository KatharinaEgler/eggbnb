Rails.application.routes.draw do
  resources :articles
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chickens, only: [:create, :new, :index, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :update, :show]

  get "chickens/dashboard", to: "chickens#dashboard", as: "dashboard"

end
