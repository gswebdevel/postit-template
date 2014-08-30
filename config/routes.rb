PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # these are not resources because no CRUD or DB used
  get '/register', to: 'users#new'
  # time to create a session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]
  resources :comments, only: [:create, :show]

  resources :users, only: [:create, :show, :edit, :update]

end

