Rails.application.routes.draw do
  # prob dont need this
  resources :user_cryptos #, only: [:create]

  root to: "main#index"
end
