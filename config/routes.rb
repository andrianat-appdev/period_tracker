Rails.application.routes.draw do
  root :to => "cycles#index"
  # Routes for the Cycle resource:
  # CREATE
  get "/cycles/new", :controller => "cycles", :action => "new"
  post "/create_cycle", :controller => "cycles", :action => "create"

  # READ
  get "/cycles", :controller => "cycles", :action => "index"
  get "/cycles/:id", :controller => "cycles", :action => "show"

  # UPDATE
  get "/cycles/:id/edit", :controller => "cycles", :action => "edit"
  post "/update_cycle/:id", :controller => "cycles", :action => "update"

  # DELETE
  get "/delete_cycle/:id", :controller => "cycles", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
