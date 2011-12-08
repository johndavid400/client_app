ClientApp::Application.routes.draw do

  get "home/index"
  get "home/finished"
  resources :applications
  root :to => 'home#index'

end
