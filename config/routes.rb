PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # these are not resources because no CRUD or DB used
  get '/register', to: 'users#new'
  # time to create a session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  #post '/votes', to 'VoteController#create'
  # must pass infor votes
  # resources :votes, only: [:create]
  #or
  #post '/posts/:id/vote', to: "PostsController:vote"
  #post '/comments/:id/vote', to: "CommentsController:vote"


  resources :posts, except: [:destroy] do
    # for votes
    member do
      post :vote
    end

    resources :comments, only: [:create] do
      # for votes
      member do
        post :vote
      end
    end
  end
  resources :categories, only: [:new, :create, :show]
  #resources :comments, only: [:create, :show]

  resources :users, only: [:create, :show, :edit, :update]

end

