Advisor::Application.routes.draw do

  root to:'hotels#top_five'
  resources :hotels, only: [:new,:show,:index,:create]
  resources :ratings, only: [:create]
  resources :comments, only: [:create]
  devise_for :users
end
