Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :disciplines

  resources :docs do
    resources :versions, only: [:new, :create, :destroy]
  end

  root to: "home#index"

  devise_for :users
end
