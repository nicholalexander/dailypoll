Dailypoll::Application.routes.draw do
  namespace :administrator do
    get '/', to: "administrator#index"
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'destroyall', to: 'administrator#destroy_all'

    post 'adminlogin', to: 'sessions#create'

    resources :users
    resources :questions
  end

  post 'gettext', to: 'receivetext#receive_text'
  post 'getvoice', to: 'receivetext#voice_response'
  resources :users
  resources :questions
  root "home#index"
end
