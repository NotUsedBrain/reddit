Rails.application.routes.draw do
  devise_for :users
  


  resources :communities do
    resources :posts do
      resources :comments
    end
  end
  
  root to: 'communities#index'

end
