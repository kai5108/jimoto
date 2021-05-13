Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :places, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :place_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
  end
end
