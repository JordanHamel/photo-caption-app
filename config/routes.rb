CaptionApp::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  root :to => 'static_pages#home'

 	resources :users do
 		member do
 			get :show_user_photos
 		end
 	end

  resources :photos do
  	member do
  		get :show_file
  		get :new_share_email
  		post :send_share_email
  	end
  end

end