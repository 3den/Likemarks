Likemarks::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :import, only: [:create]
  resources :searches, only: [:show, :index]

  get "user/:id" => "searches#show", as: 'user'
  get "search" => "searches#index", as: 'search'
  get "terms" => "pages#terms"

  match ":action.appcache", controller: :cache, format: :appcache

  root :to => "pages#home"
end
