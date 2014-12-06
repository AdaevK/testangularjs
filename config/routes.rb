Rails.application.routes.draw do
  root to: 'application#index'

  namespace :api do
    resources :adverts, only: [:index, :create, :show]
    resources :photos, only: [:create, :destroy]
  end

  get '*path' => 'application#index'

end
