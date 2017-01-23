Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :monsters do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :monsters, only: [:index, :create]
    end
  end
end
