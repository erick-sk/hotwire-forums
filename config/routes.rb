Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :posts, only: [:show, :create, :edit, :update], module: :discussions
  end
  root 'main#index'
end
