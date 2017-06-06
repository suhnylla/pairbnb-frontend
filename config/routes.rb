Rails.application.routes.draw do

  get 'braintree/new'
  post 'braintree/checkout'

  get 'uploads/new'

  get 'uploads/create'

  get 'uploads/index'

  resources :reviews
  resources :message_threads
  resources :messages
  resources :payments
  resources :reservations, except: [:create]
  resources :listings do
    resources :reservations, only: [:new, :create]
  end
  resources :users
  resources :uploads
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
