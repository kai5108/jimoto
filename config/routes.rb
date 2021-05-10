Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :places, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
end
