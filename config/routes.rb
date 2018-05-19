Rails.application.routes.draw do
  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  get "logout" => "session#destroy", :as => "logout"
  get "login" => "session#new", :as => "login"
  post "login" => "session#create"
  get "signup" => "users#new", :as => "signup"

  resources :notes
  resources :users
  resources :session

  resource :users do
    collection do
      get "createAdmin"
    end
  end

  root :to => "notes#index"
end
