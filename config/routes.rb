Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :monsters do
    resources :reviews
  end
end
