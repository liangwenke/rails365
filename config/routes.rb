Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  root to: 'articles#index'
  namespace :admin do
    root to: "articles#index"
    resources :articles, only: [:edit, :destroy, :index, :new, :update, :create]
  end
end
