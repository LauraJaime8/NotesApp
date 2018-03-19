Rails.application.routes.draw do


  devise_for :users
  resources :notes
  root :to => "notes#index"

=begin
    get "/notes" index
    post "/notes" create
    delete "/notes/:id" delete
    get "/notes/:id" show
    get "/notes/new" new
    get "/notes/:id/edit" edit
    patch "/notes/:id" update
    put "/notes/:id" update
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
