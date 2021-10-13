Rails.application.routes.draw do
  resources :follows
  resources :posts
  resources :users

  post '/profile/:id/follow', to: "users#follow", as: "follow_user"
  post '/profile/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  get '/profile/:id/logout', to: "main#logout", as: "logout"

  get '/main', to: "main#logIn", as: "main"
  post '/main', to: "main#findUser"

  get '/register', to: "users#new", as: "register"
  post '/register', to: "users#create"

  get '/feed/:id', to: "main#feed", as: "feed"
  post '/feed/:id/new_post', to: 'posts#new', as: 'create_post'

  get '/profile/:name', to: 'main#profile', as: "profile"


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
