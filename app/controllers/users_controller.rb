class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
		@photos = @user.photos
	end

	def show_profile_pic
		profile_pic = User.find(params[:id])
		send_data(profile_pic.profile_pic, type: 'image/jpg', disposition: 'inline')
	end
end