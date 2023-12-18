Rails.application.routes.draw do
  resources :devices, only: [:index, :show]
end
