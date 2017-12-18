Rails.application.routes.draw do
  resource :session, only: %i(new create destroy)
  resources :users, only: %i(show create new)
  resources :users do
    resources :goals, only: [:create]
  end
  resources :goals, except: [:index, :create]
end
