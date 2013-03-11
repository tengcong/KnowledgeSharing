KnowledgeSharing::Application.routes.draw do
  get "articles/create"

  get "articles/index"

  devise_for :users
  resources :articles
  resources :tags
  root :to => "main#index"
end
