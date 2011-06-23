DividendReporter::Application.routes.draw do

  root :to => 'user_sessions#new'

  resources :roles
  resources :stocks 

  get 'stocks/:id/watch' => "stocks#watch", :as => 'stocks_watch'
  get 'stocks/:id/unwatch' => "users#unwatch", :as => 'stocks_unwatch'

  resources :user_sessions
  resources :users

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

end
