class PhotosController < ApplicationController
	before_filter :authenticate_user!

	def new
		@photo = Photo.new
	end

	def create
		file = params[:photo].delete(:file).read

		@photo = Photo.new(params[:photo])
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
		@photo = Photo.find(params[:id])
	end

	def show_file
		file = Photo.find(params[:id])
		send_data(file.file, type: 'image/jpg', disposition: 'inline')
	end

	def index
	end

	def edit
	end

	def update
	end

end
