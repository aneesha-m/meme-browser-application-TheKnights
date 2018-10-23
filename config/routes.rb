Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: "tag"

  resources :posts do
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end

  devise_for :users
end
