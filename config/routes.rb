Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "users/registrations"
    }

  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets do
    resources :comments, only: [:new, :create]
  end

  get  'profiles/:id/detail', to: 'profiles#detail'
  post 'tweets/:id/like',     to: 'tweets#like'

  root   'tweets#index'
end
