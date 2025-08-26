Rails.application.routes.draw do
  resources :posts do
    scope module: :posts do
      resources :reactions, only: [:create]
    end
  end
  devise_for :users


  unauthenticated do
    root "pages#home"
  end

  authenticated :user do
    root to: "feed#show", as: :authenticated_user_root
  end



  get "up" => "rails/health#show", as: :rails_health_check
end
