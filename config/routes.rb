Rails.application.routes.draw do
  devise_for :users
  
  resources :communities do
    namespace :communities do
      resources :posts do
        resources :comments
      end
    end
  end

  resources :posts, only: [:new, :create, :show] do
    resources :likes, only: [:create, :update, :destroy] 
  end

  root to: 'communities#index'

end
