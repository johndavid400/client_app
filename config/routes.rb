ClientApp::Application.routes.draw do

  get "home/index"
  resources :applications
  root :to => 'home#index'

end
