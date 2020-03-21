Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :users, only: %i(index show)
  resources :reactions, only: %i(create)
  resources :matching, only: %i(index)
  resources :chat, only: %i(create show)
end
