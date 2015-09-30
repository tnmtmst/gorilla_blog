Rails.application.routes.draw do
  resources :users
  resources :articles, shallow: true do
    resources :comments
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :user_sessions, only: [:new, :create, :destroy]

  root 'articles#index'

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  scope controller: 'themes', filepath: /.*/ do
    get '/theme/:filepath', action: 'assets'
  end
end
