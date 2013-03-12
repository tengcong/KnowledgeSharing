KnowledgeSharing::Application.routes.draw do

  get "tags/index"

  devise_for :users
  resources :articles
  resources :tags
  root :to => "main#index"
end
