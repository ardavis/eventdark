Rails.application.routes.draw do
  root to: 'events#index'
  resources :events do
    post 'attend', on: :member
  end
  resources :locations
end
