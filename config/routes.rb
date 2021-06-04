Rails.application.routes.draw do
  get 'sessions/new'
  root "home#top"
 
  # get 'users/create' 
  # get "user/new" => "users#new"
  
  get 'posts/create'
  
  resources :users
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destroy"
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
