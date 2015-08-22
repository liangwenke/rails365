Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  root to: 'articles#index'
  namespace :admin do
    root to: "articles#index"
    resources :articles, only: [:edit, :destroy, :index, :new, :update, :create]
  end
  %w(404 422 500).each do |code|
    get code, to: "errors#show", code: code
  end

  resources :photos, only: [:create]
end
