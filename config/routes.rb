Rails.application.routes.draw do
 

  # Frontend
  
  resources :sessions, only: [:create, :destroy]
  
  resources :users, except: [:index, :destroy] do
    member do
      get :history
    end
  end
  
  resources :products do
    member do
      get :checkout
      patch :buy
    end
  end

namespace :api, defaults: { format: :json } do
   resources :sessions, only: :create
resources :users do
  resources :posts
  resources :comments
  resources :walls
  member do
    get :followers
    get :following
    
  end
end
resources :walls do
  resources :posts
end
resources :posts do
  resources :comments
end


  
  root 'posts#index'
end

end