class RegistrationsController < Devise::RegistrationsController

	def new
		@user = User.new
	end

  def create
  	@user = User.new(params[:user])

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
  	@user = User.find_by_id(current_user.id)

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