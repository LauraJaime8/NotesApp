Rails.application.routes.draw do


  resources :notes
=begin
    get "/notes" index
    post "/notes" create
    delete "/notes" delete
    get "/notes/:id" show
    get "/notes/new" new
    get "/notes/:id/edit" edit
    patch "/notes/:id" update
    put "/notes/:id" update
=end
  root :to => "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
