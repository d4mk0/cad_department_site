Rails.application.routes.draw do
  resources :versions, except: :show

  resources :docs

  root to: "home#index"

  devise_for :users
end
