Rails.application.routes.draw do
  # resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/callback' => 'webhook#callback'
  match '*unmatched_route', :to => 'application#raise_not_found!', :via => :all
end
