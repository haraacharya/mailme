Mailme::Application.routes.draw do
  
  root to: "users#index"

  resources :users, only: [:create, :show] do
    resources :mailmemails, only: [:new, :create]
  end

  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: redirect("/")
  match "signout", to: "sessions#destroy", as: "signout"

end
