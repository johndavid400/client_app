ClientApp::Application.routes.draw do

  devise_for :users do
    root :to => 'home#index'
  end
  get "home/index"
  resources :client_applications
  resources :users
  root :to => 'home#index'

  match "add_attachments" => "client_applications#add_attachments"

end
