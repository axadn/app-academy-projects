Rails.application.routes.draw do
  resources :sessions, only: [:create, :new, :destroy]
  resources :users
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, except: [:new, :create]
  resources :subs, except: [:destroy]
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]
  post '/comments/:id/upvote', to: 'comments#upvote'
  post '/comments/:id/downvote', to: 'comments#downvote'
  post '/posts/:id/upvote', to: 'posts#upvote'
  post '/posts/:id/downvote', to: 'posts#downvote'
end
