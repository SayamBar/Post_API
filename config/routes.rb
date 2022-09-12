Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  scope module: 'users' do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :likes
  end
  

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
    end
  end
end