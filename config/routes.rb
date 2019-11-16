Rails.application.routes.draw do
   root 'microposts#index'
   resources :comments
   resources :users
   
   resources :microposts do
    resources :comments
   end
end
