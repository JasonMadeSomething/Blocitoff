Rails.application.routes.draw do

  devise_for :users
  
  
  
  authenticated :user do
    root "users#show", as: :user_root
  end
  
  root to: "welcome#home"
end
