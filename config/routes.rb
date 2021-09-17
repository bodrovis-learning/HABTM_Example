Rails.application.routes.draw do
 # get 'books/index'
  get 'books/new', to: 'books#new'
  get 'books/:id', to: 'books#show', constraints: { id: /\d+/ }
  get 'books/:topic', to: 'books#topic'

  post 'books/create', to: 'books#create'

  get 'books/edit/:id', to: 'books#edit'
  post 'books/update/:id', to: 'books#update'

  get 'books', to: 'books#index'
  #get 'posts/all', to: 'posts#all'
  #get 'posts/:id', to: 'posts#show'

  resources :physicians, only: [:new, :create, :show, :index, :destroy]

  resources :patients, only: [:new, :create, :show, :edit, :update]

  namespace :admin do
    resources :physicians, only: [:new, :create, :show, :index, :destroy]
  end
 

  root to: "books#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
