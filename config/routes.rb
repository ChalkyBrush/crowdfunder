Crowdfunder::Application.routes.draw do

  



  resources :users, :except => [:index]
  resources :projects
  resources :user_sessions

  	match 'login' => 'user_sessions#new', :as => :login
	match 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => "welcome#index"

end
