Rails.application.routes.draw do
  resources :adverts, only: [:index, :create, :show]
  resources :photos, only: [:create, :destroy]
end
