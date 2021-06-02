Rails.application.routes.draw do
  root to: 'homes#top'
  get 'searches/search'
  devise_for :users
  resources :groups, only: [:create, :new, :index, :show]
  resources :places, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :place_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'follow' => 'users#follow'
    get 'follower' => 'users#follower'
  end
end
