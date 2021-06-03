Rails.application.routes.draw do
  root "home#top"
 
  # get 'users/create' 
  # get "user/new" => "users#new"
  
  get 'posts/create'
  
  resources :users

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
