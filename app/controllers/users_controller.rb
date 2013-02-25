class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		profile_pic = params[:user].delete(:profile_pic).read

		@user = User.new(params[:user])
		@user.profile_pic = profile_pic

		if @user.save
			flash[:success] = "Your profile has been created!"
			redirect_to @user
		else
			flash[:error] = "Could not create your profile. Check the errors below!"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:user])
	end

	def index
	end

	def edit
	end

	def update
	end

end
