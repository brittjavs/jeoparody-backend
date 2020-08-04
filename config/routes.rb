Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
 
      resources :users
      post "/login", to: "sessions#login"
      post "/signup", to: "users#create"
      delete "/logout", to: "sessions#logout"
      get "get_current_user", to: "sessions#get_current_user"


      resources :scores, only: [:create, :index]
    end
  end
end

