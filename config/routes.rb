CaptionApp::Application.routes.draw do

  root :to => 'users#show'

  resources :users
  resources :photos
  resource :session, only: [:new, :create, :destroy]
end
