Rails.application.routes.draw do
  resources :timetables, only: [:index, :show]
  resources :employees, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :ads, only: [:create, :index] do
    get 'employment', on: :collection
  end

  mount Ckeditor::Engine => '/ckeditor'
  ActiveAdmin.routes(self)
  resources :disciplines

  resources :docs do
    resources :versions, only: [:new, :create, :destroy]
  end

  root to: "home#index"

  devise_for :users

  match '/search', to: 'home#search', via: :all

  # Next route should be placed at the bottom of the list of routes
  match '*path', to: 'home#page', via: :get
end
