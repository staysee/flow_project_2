Rails.application.routes.draw do

  # STATIC PAGE ROUTES
  #route for our home page
  root 'static_pages#home'
  #route for an about page
  get 'static_pages/about' => 'static_pages#about', as: :about
  get 'static_pages/contact' => 'static_pages#contact', as: :contact

  # USERS ROUTES
  #route to users index page - list of all users
  get 'users/' => 'users#index', as: :users
  #route to users sign up form
  get 'users/new' => 'users#new', as: :new_user
  #route to users show/profile page
  get 'users/:id' => 'users#show', as: :user
  #route to post user form to
  post '/' => 'users#create'


  # SESSIONS ROUTES
  #display form
  get 'sessions/new' => 'sessions#new', as: :new_session
  #create a new session (this is the login post)
  post 'sessions/new' => 'sessions#create', as: :create_session
  #destroy the session and log a user out
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets

  resources :users
end
