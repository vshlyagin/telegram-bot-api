Rails.application.routes.draw do
  resources :meteostations, only: [:index, :create]
end
