Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets
  root 'tweets#index'
end
