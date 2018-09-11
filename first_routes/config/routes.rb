Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  
  resources :users, only: [:show, :update, :index, :destroy, :create]
  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]
  resources :users do 
    resources :artworks, only: [:index]
  end
  resources :comments, only: [:create, :destroy, :index]
end
