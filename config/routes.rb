CaptionApp::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  root :to => 'static_pages#home'

  # REV: more tabs
 	resources :users do
 		member do
 			get :show_profile_pic
  # REV: I think you want a nested photos resource?
 			get :show_user_photos
 			get :show
 		end
 	end

  resources :photos do
  	member do
  		get :show_file
  	end
  end

end
