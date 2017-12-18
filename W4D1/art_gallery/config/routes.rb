Rails.application.routes.draw do
  # resources :users
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/', to: 'users#index'
  post 'users/', to: 'users#create'
  get 'users/new', to: 'users#new'
  get 'users/:id/edit', to: 'users#edit'
  get 'users/:id', to: 'users#show'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  get 'users/:user_id/artworks', to: 'artworks#index'

  post 'artworks/', to: 'artworks#create'
  get 'artworks/new', to: 'artworks#new'
  get 'artworks/:id/edit', to: 'artworks#edit'
  get 'artworks/:id', to: 'artworks#show'
  patch 'artworks/:id', to: 'artworks#update'
  put 'artworks/:id', to: 'artworks#update'
  delete 'artworks/:id', to: 'artworks#destroy'

  resources :artwork_shares, only: [:create, :destroy]
end
