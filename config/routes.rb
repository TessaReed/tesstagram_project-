Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  
  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end

  get 'comments#index' => 'comments#index'


  #get 'landing/index' add root

  root 'photos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
