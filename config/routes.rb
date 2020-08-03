Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # post '/signup', to: "users#signup"
      # testing out the article:
      # post '/login', to: "sessions#login"

      # From this article: https://medium.com/better-programming/build-a-rails-api-with-jwt-61fb8a52d833
      resources :users, only: [:show, :create, :index, :destroy]
      post "/login", to: "users#login"
      post '/signup', to: "users#create"
      get "/auto_login", to: "users#auto_login"


      resources :scores, only: [:create, :index]
    end
  end
end

