Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :listings
  resources :conversations do
    resources :messages
  end
  post 'payments/webhook', to: 'payments#webhook'
  get 'payments/success', to: 'pages#payment_success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
