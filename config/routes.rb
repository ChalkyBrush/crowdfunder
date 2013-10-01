Crowdfunder::Application.routes.draw do

  

  get "user_sessions/new"

  get "user_sessions/create"

  get "user_sessions/destroy"

  resources :users, :except => [:index]
  resources :projects
  resources :user_sessions

  	match 'login' => 'user_sessions#new', :as => :login
	match 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => "welcome#index"

end
