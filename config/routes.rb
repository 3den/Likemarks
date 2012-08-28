Likemarks::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match "cache.manifest" => "cache#show", format: :manifest,
    as: :appcache

  resources :import, only: [:create]
  resources :searches, only: [:show, :index]

  get "user/:id" => "searches#show", as: 'user'
  get "search" => "searches#index", as: 'search'
  get "terms" => "pages#terms"

  root :to => "pages#home"
end
