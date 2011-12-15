ClientApp::Application.routes.draw do

  get "home/index"
  get "home/finished"
  resources :client_applications
  root :to => 'home#index'

  match "attachment_upload" => "client_applications#attachment_upload"
  match "attachment_destroy" => "client_applications#attachment_destroy"

end
