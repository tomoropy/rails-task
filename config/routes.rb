Rails.application.routes.draw do
  root   'tweets#index'

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "users/registrations"
    }

  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets do
    resources :comments, only: [:new, :create]
  end

  get  'profiles/:id/detail', to: 'profiles#detail'
  get  'profiles/:id/likes',  to: 'profiles@likes'

  post 'tweets/:id/like',     to: 'tweets#like_tweet'
  post 'comments/:id/like',   to: 'comments#like_comment'

end
