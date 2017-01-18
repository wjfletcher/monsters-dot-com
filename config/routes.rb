Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :monsters
end
