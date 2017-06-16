Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :pledges, only: [:index, :destroy]
  resources :events do
    post 'attend', on: :member
    delete 'decline', on: :member
  end
  resources :locations
end
