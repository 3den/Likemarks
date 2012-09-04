Likemarks::Application.routes.draw do
  get "user/show"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match "cache.manifest" => "cache#show", format: :manifest,
    as: :appcache

  resources :links, only: [:index]
  resources :users, only: [:show]

  scope "api", format: :json do
    resources :links, only: [:index]
    resources :users, only: [:show]
    get "home" => "pages#home"
  end

  get "terms" => "pages#terms"
  get "home" => "pages#home"
  get "search" => "links#index", as: :search
  get "search/:q" => "links#index"
  get "user/:id" => "users#show"
  get ":id" => "users#show", as: :user

  root :to => "pages#home"
end
