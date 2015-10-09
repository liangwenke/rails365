Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  resources :groups, only: [:show, :index]
  root to: 'articles#index'
  namespace :admin do
    root to: "articles#index"
    resources :articles, only: [:edit, :destroy, :index, :new, :update, :create]
    resources :groups, only: [:edit, :destroy, :index, :new, :update, :create]
    resources :exception_logs, only: [:show, :destroy, :index] do
      delete :destroy_multiple, on: :collection
    end
    resources :tags, only: [:index, :show]
  end
  %w(404 422 500).each do |code|
    get code, to: "errors#show", code: code
  end

  patch '/photos', to: "photos#create"
  get 'tags/:tag_id', to: 'articles#index', as: :tag
end
