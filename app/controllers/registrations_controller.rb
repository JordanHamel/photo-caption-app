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
  	super
  end

  def update
  end

  def index
  	super
  end

  def destroy
  	super
  end

end