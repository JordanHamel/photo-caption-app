class PhotosController < ApplicationController

	def new
		@photo = Photo.new
	end

	def create
		file = params[:user].delete(:file).read

		@photo = Photo.new(params[:user])
		@photo.file = file

		if @photo.save
			flash[:success] = "Your photo has been successfully uploaded!"
			redirect_to @photo
		else
			flash[:error] = "Well, that didn't work! Care to try again?"
			render 'new'
		end
	end

	def show
		@photo = Photo.find(params[:photo])
	end

	def index
	end

	def edit
	end

	def update
	end

end
