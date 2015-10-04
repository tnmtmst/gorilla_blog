Rails.application.routes.draw do
  resources :users
  resources :articles, shallow: true do
    resources :comments
  end
  #get 'articles/:id/:filename' => 'articles#picture'
  get 'articles/:id/:filename' => 'articles#picture', filename: /[^\/]+/
  match 'remove_picture/:id' => 'articles#remove_picture', via: [:get, :post], as: 'remove_picture'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :user_sessions, only: [:new, :create, :destroy]

  root 'articles#index'

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  #scope controller: 'articles', filepath: /.*/ do
  #  get '/articles/:id/:filename', action: 'picture'
  #end

  scope controller: 'themes', filepath: /.*/ do
    get '/theme/:filepath', action: 'assets'
  end
end
