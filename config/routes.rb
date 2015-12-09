Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
    root "users#show", as: :user_root
    resources :users, only: [] do
      resources :items, only: [:create]  do
        put :complete
        put :archive
        put :activate
      end
    end
  end
  
  root to: "welcome#home"
end
