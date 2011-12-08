ClientApp::Application.routes.draw do
  resources :applications

  root :to => 'applications#index'
end
