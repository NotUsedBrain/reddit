Rails.application.routes.draw do
  devise_for :users
  
  resources :communities do
    namespace :communities do
      resources :posts do
        resources :comments
      end
    end
  end

  resources :posts, only: [:new, :create]
  
  root to: 'communities#index'

end
