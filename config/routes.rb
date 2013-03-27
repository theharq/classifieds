Classifieds::Application.routes.draw do

  resources :pages, only: [:index, :create]
  resources :alerts, except: [:show] do
    collection do
      post :search
    end
  end

  root :to => 'pages#index'
end
