Rails.application.routes.draw do
  get 'sessions/new'
  root "home#top"
 
  get 'posts/create'
  # ホーム画面で業務を一覧表示させるため、indexアクションとする
  get  "/home" => "posts#index" 
  
  resources :users
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
