Rails.application.routes.draw do
  resources :photos, only: [:create, :destroy]
end
