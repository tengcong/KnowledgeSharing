KnowledgeSharing::Application.routes.draw do

  devise_for :users
  resources :articles
  resources :tags
  root :to => "main#index"
end
