Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create]
  resources :links, only: [:index]
end
