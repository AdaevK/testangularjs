Rails.application.routes.draw do
  root to: 'application#index'
  get '*path' => 'application#index'

  resources :adverts, only: [:index, :create, :show]
  resources :photos, only: [:create, :destroy]
end
