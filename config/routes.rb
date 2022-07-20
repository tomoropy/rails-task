Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "users/registrations"
    }

  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets do
    resources :comments, only: [:new, :create]
  end

  get 'profiles/:id/detail', to: 'profiles#detail'

  post   'likes/create',    to: 'likes#create'
  delete 'likes/destroy',   to: 'likes#destroy'

  root   'tweets#index'
end
