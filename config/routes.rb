Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :new, :create]
  root 'main#index'
end
