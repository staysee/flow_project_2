Rails.application.routes.draw do

  # STATIC PAGE ROUTES
  #route for our home page
  root 'static_pages#home'
  #route for an about page
  get 'about' => 'static_pages#about', as: :about
  get 'contact' => 'static_pages#contact', as: :contact

  # USERS ROUTES
  #route to users index page - list of all users
  get 'users/' => 'users#index', as: :users
  #route to users sign up form
  get 'users/new' => 'users#new', as: :new_user
  #route to edit user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  #route to post user form to
  post '/' => 'users#create'
  # user's event page
  get 'users/:id/event' => 'users#show_event', as: :show_event
  #route to users show/profile page
  get 'users/:id' => 'users#show', as: :user

  resources :users do
    resources :events
  end

  # SESSIONS ROUTES
  #display form
  get 'sessions/new' => 'sessions#new', as: :new_session
  #create a new session (this is the login post)
  post 'sessions/new' => 'sessions#create', as: :create_session
  #destroy the session and log a user out
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets


  # EVENTS ROUTES
  #route to events index page - list of all events
  get 'events/' => 'events#index', as: :events
  #route to form for creating a new event
  get 'events/new' => 'events#new', as: :new_event
  #create a new event
  post 'events/' => 'events#create'
    #route to individual event page
  get 'events/:id' => 'events#show', as: :event

  namespace :api do
    resources :events, only:[:index, :show]
  end


  # POSTS ROUTES
  get 'posts/' => 'posts#index', as: :posts
  #create posts
  post 'posts/' => 'posts#create'
  #destroy posts
  delete 'posts/:id' => 'posts#destroy'
  #
  get 'posts/:id' => 'posts#show', as: :post


end
