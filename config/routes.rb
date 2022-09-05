Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :discussions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :posts, only: [:show, :create, :edit, :update, :destroy], module: :discussions

    collection do
      get 'category/:id', to: "categories/discussions#index", as: :category
    end
  end
  root 'main#index'
end
