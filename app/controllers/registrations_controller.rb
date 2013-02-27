class RegistrationsController < Devise::RegistrationsController

	def new
		@user = User.new
	end

  def create
  	profile_pic = params[:user].delete(:profile_pic).read

  	@user = User.new(params[:user])
  	@user.profile_pic = profile_pic

  	if @user.save
  		flash[:success] = "Your account has been created!"
  		sign_in @user
  		redirect_to @user
  	else
  		flash[:error] = "That didn't work! Try again?"
  		render 'new'
  	end
  end

  def edit
  	@user = User.find_by_id(current_user.id)
  end

  def update
  	if params[:user][:profile_pic]
	  	profile_pic = params[:user].delete(:profile_pic).read
	  end

  	@user = User.find_by_id(current_user.id)
  	@user.profile_pic = profile_pic if params[:user][:profile_pic]

  	if @user.update_attributes(params[:user])
  		flash[:success] = "Yay! Your account has been updated!"
  		redirect_to @user
  	else
  		flash[:error] = "That didn't work very well... Care to try again?"
  		render 'edit'
  	end
  end


  def index
  	super
  end

  def destroy
  	super
  end

end
