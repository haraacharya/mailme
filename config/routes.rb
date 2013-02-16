Mailme::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  #root to: "users#index"
  root to: "static_pages#home"

  resources :users, only: [:create, :show, :index] do
    resources :mailmemails, only: [:new, :create]
  end

  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: redirect("/")
  match "signout", to: "sessions#destroy", as: "signout"

end
