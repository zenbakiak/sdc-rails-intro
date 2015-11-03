Rails.application.routes.draw do

  devise_for :users

  resources :gags do
    member do
      post :vote
    end
    resources :comments
  end

  root 'gags#index'
end
