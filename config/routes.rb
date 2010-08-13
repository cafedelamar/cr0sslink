ActionController::Routing::Routes.draw do |map|
  map.resources :challenges

  map.auth_start '/authorize', :controller => 'authorize', :action => 'start'
  map.auth_callback '/authorize/callback', :controller => 'authorize', :action => 'callback'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
