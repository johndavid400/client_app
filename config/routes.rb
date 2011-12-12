ClientApp::Application.routes.draw do

  get "home/index"
  get "home/finished"
  resources :client_applications
  root :to => 'home#index'

end
