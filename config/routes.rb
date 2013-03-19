Classifieds::Application.routes.draw do

  resources :pages, only: [:index, :create]
  resources :alerts, only: [:new, :create]

  root :to => 'pages#index'
end
