Rails.application.routes.draw do
  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  get "logout" => "session#destroy", :as => "logout"
  get "login" => "session#new", :as => "login"
  post "login" => "session#create"
  get "signup" => "users#new", :as => "signup"

  resources :notes
  get '/notes/collection/:name', to: 'notes#collections'
  
  resources :users
  resources :session

  put 'admin/:id' => 'users#make_admin', :as => "make_admin"

  root :to => "notes#index"
end
