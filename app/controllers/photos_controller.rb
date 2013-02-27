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
		@captions = ["caption1", "caption2", "caption3", "caption4", "caption5"]
	end

	def show_file
		file = Photo.find(params[:id])
		send_data(file.file, type: 'image/jpg', disposition: 'inline')
	end

	def update
		photo = Photo.find(params[:id])
		photo.caption = params[:caption]

		if photo.save
			render nothing: true
		else
			flash[:error] = "That didn't save :( Try clicking the button again!"
			render 'new'
		end
	end

	def new_share_email
		@photo = Photo.find(params[:id])
	end

	def send_share_email
		@photo = Photo.find(params[:id])
		PhotoMailer.share_photo(params[:photo][:email]).deliver

		redirect_to current_user
	end

end
