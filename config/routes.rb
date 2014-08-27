PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
<<<<<<< HEAD
    resource :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]

  end
=======
    resource :comments, only: [:create, :show]
  end
end
>>>>>>> FETCH_HEAD
