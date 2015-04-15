Rails.application.routes.draw do
  resources :docs

  root to: "home#index"

  devise_for :users
end
