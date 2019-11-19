Rails.application.routes.draw do
  resources :microposts
  resources :users
   
  #Login Google
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'me', to: 'me#show', as: 'me'
  get 'issues', to: 'microposts#index', as: 'issues'

  root to: "home#show"
end