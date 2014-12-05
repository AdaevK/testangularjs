Rails.application.routes.draw do
  root to: 'application#index'

  resources :adverts, only: [:index, :create, :show]
  resources :photos, only: [:create, :destroy]

  get '*path' => 'application#index'

end
