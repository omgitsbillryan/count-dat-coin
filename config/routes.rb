Rails.application.routes.draw do
  # prob dont need this
  resource :user_crypto #, only: [:create]

  root to: "main#index"
end
