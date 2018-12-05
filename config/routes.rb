Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: "tag"

  get 'profile/index'

  resources :posts do
  	resources :comments
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  resources :comments do
  	resources :comments
    put "like", to: "comments#upvote"
    put "dislike", to: "comments#downvote"
  end

  devise_for :users, controllers: { sessions: 'user/sessions' }


end
