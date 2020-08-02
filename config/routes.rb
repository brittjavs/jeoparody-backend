Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/signup', to: "users#signup"
      post '/login', to: "sessions#login"
      resources :scores, only: [:index]
      resources :users, only: [:show, :index, :destroy]
    end
  end
end

# Do we want to namespace the routes?
# Do we want it to be nested?
  # scores would be separate so we could index highest scores from all users

