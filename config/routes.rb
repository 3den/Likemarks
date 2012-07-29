Likemarks::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :import, only: [:create]
  resources :searches, only: [:show, :index]

  get "user/:id" => "searches#show", as: 'user'
  get "terms" => "pages#terms"

  root :to => 'searches#index'
end
