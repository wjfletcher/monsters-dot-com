Rails.application.routes.draw do
  root "monsters#index"
  devise_for :users
  resources :monsters do
    resources :reviews do
      resources :votes do
        collection do
          post 'handle_vote'
        end
      end
    end
  end
end
