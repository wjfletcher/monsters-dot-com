Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :users, only: [:show]
  resources :monsters do
    collection do
      get 'home'
    end
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

  namespace :api do
    namespace :v1 do
      resources :monsters, only: [:index, :create]
    end
  end

end
