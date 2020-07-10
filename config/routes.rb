Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'static_pages#home'
  get '/help' , to:'static_pages#help'
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  #, :only %i(new create)
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
