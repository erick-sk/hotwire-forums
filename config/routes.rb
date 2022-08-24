Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :new, :create, :edit, :update, :destroy]
  root 'main#index'
end
