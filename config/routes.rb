Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :users, only: [:show]
  resources :monsters do
    resources :reviews do
      resources :votes do
        collection do
          post 'handle_vote'
        end
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end
end
