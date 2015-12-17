Rails.application.routes.draw do
  root to: "home_screen#login"
  resources :timeline, only: [:index,:show,:new,:create]
  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  patch '/favorite', to: "tweet#update"
end
