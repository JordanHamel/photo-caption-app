class PhotosController < ApplicationController
	before_filter :authenticate_user!, except: [:show]


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
			flash[:error] = "Well, that didn't work! Care to try again? (Your file might be too big)"
			render 'new'
		end
	end

	def show
		@photo = Photo.find(params[:id])
		@captions = CAPTIONS
	end

	def show_file
		photo = Photo.find(params[:id])
		send_data(photo.file, type: 'image/jpg', disposition: 'inline')
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
		PhotoMailer.share_photo(params[:photo][:email], current_user.name , @photo).deliver

		redirect_to current_user
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy

		redirect_to current_user
	end

end
