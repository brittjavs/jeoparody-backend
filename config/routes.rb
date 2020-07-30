Rails.application.routes.draw do
  resources :users
  resources :scores
end

# Do we want to namespace the routes?
# Do we want it to be nested?
