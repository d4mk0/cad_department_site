Rails.application.routes.draw do
  resources :docs do
    resources :versions, only: [:new, :create, :destroy]
  end

  root to: "home#index"

  devise_for :users
end
