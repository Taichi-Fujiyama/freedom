Rails.application.routes.draw do
  get 'posts/create'
  get 'users/create'
  root "home#top"
  get "sign_in" => "home#sign_in"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
