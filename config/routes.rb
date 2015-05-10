Rails.application.routes.draw do
  resources :employees, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :ads, only: [:index, :show]

  mount Ckeditor::Engine => '/ckeditor'
  ActiveAdmin.routes(self)
  resources :disciplines

  resources :docs do
    resources :versions, only: [:new, :create, :destroy]
  end

  root to: "home#index"

  devise_for :users

  # Next route should be placed at the bottom of the list of routes
  match '*path', to: 'home#page', via: :get
end
