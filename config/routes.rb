Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chickens, only: [:create, :new, :index, :show, :destroy] do
    resources :bookings, only: [:create, :destroy]
  end

  resources :bookings, only: [:index, :update, :show]
  resources :users, only: [:index, :update, :show, :destroy]

  # get "chickens/dashboard", to: "chickens#dashboard", as: "dashboard"

end
