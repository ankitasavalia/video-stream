Rails.application.routes.draw do
  
  root 'dashboard#index'
  devise_for :users
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :videos 
end
