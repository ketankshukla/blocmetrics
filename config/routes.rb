Rails.application.routes.draw do

  resources :registered_applications
  devise_for :users
  root 'home#index'
  resources :users, only: [:show]

end
