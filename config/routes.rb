Dailypoll::Application.routes.draw do
  namespace :administrator do
    get '/', to: "administrator#index"
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'destroyall', to: 'administrator#destroy_all'

    post 'adminlogin', to: 'sessions#create'

    resources :users
  end

  resources :users
  resources :questions
  root "home#index"
end
