Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  root 'pages#index'
end
