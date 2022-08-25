Rails.application.routes.draw do
  devise_for :users
  resources :discussions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :posts, olny: [:create], module: :discussions
  end
  root 'main#index'
end
