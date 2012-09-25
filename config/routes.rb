Likemarks::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match "cache.manifest" => "cache#show", format: :manifest, as: :appcache

  resources :links, only: [:index]
  resources :users, only: [:show]

  scope "api", format: :json do
    resources :links, only: [:index]
    resources :users, only: [:show]
  end

  get "terms" => "pages#terms"
  get "home" => "pages#home"
  get "search" => "links#index", as: :search
  get "search/:q" => "links#index"
  get ":username" => "links#index", as: :user

  root :to => "pages#home"
end
