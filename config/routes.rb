Likemarks::Application.routes.draw do
  get "user/show"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match "cache.manifest" => "cache#show", format: :manifest,
    as: :appcache

  resources :searches, only: [:index]
  resources :users, only: [:show]

  scope "api", format: :json do
    resources :searches, only: [:index]
    resources :users, only: [:show]
  end

  get "terms" => "pages#terms"
  get "home" => "pages#home"
  get "search" => "searches#index", as: :search
  get "search/:q" => "searches#index"
  get "user/:id" => "users#show"
  get ":id" => "users#show", as: :user

  root :to => "pages#home"
end
