CaptionApp::Application.routes.draw do

  devise_for :users

  root :to => 'static_pages#home'

 	resources :users, only: [:show]
  resources :photos do
  	member do
  		get :show_file
  	end
  end

end