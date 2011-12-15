ClientApp::Application.routes.draw do

  devise_for :users

  get "home/index"
  get "home/finished"
  resources :client_applications
  root :to => 'home#index'

end
