DividendReporter::Application.routes.draw do

  resources :roles
  resources :stocks
  
  root :to => 'user_sessions#new'

  resources :user_sessions
  resources :users

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout


end
