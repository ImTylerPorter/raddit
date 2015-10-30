Rails.application.routes.draw do
  resources :comments

  devise_for :users
  resources :links do
    member do
      put "like", to:    "links#upvote"
      put "dislike", to: "links#downvote" # -> controller#action
    end
    resources :comments
  end
  root "links#index"
end
