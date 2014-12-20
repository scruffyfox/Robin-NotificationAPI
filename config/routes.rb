Notifications::Application.routes.draw do
  match "users/" => "users#add_user", :via => [:post, :put]
  match "users/:id" => "users#update_user", :via => [:post, :put]
  match "users/:user_id/devices/" => "devices#add_device", :via => [:post, :put]
  match "users/:user_id/devices/:device_id" => "devices#update_device", :device_id => /.*/, :via => [:post, :put]

  match "users/:user_id/devices/:device_id" => "devices#delete_device", :device_id => /.*/, :via => [:delete]
  match "users/:user_id/devices/" => "devices#delete_device", :via => [:delete]
  match "users/:id/" => "users#delete_user", :via => [:delete]

  match "users" => 'users#index', :via => [:get]
  match "users/:id" => 'users#show', :via => [:get]
  match "users/:user_id/devices/:device_id" => "devices#show", :device_id => /.*/, :via => [:get]
  match "users/:user_id/devices" => "devices#index", :via => [:get]

  match ':not_found' => 'api#index', :constraints => { :not_found => /.*/ }
  match '/' => redirect("http://getrob.in")
end
