Rails.application.routes.draw do
  root "users#index"
  resources :users

  resource :session, only: [:destroy]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  post "file", to: "users#file_mailer"
end
