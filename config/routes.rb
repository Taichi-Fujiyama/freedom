Rails.application.routes.draw do
  get 'sessions/new'
  root "home#top"
 
  get 'posts/create'
  # post "/posts/:id/edit" => "posts#edit"
  # ホーム画面で業務を一覧表示させるため、indexアクションとする
  get  "/home" => "posts#index" 
  
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  
  resources :users
  resources :posts
  #投稿（業務提出)に関するルーティングを設定する
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

