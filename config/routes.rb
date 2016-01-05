Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/about'

  get 'users/' => 'users#index', as: :users
  #route to sign up form
  get 'users/new' => 'users#new', as: :new_user
  #route to show page
  get 'users/:id' => 'users#show', as: :user
  #route to post user form to
  post '/' => 'users#create'


  #display form
  get 'sessions/new' => 'sessions#new', as: :new_session
  #create a new session (this is the login post)
  post 'sessions/new' => 'sessions#create', as: :create_session

  #destroy the session and log a user out
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets

  resources :users
end
