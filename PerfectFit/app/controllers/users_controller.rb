class UsersController < ApplicationController
	
	
	before_filter :authorize, only: [ :update, :change_password]

	def new
	  @user = User.new
	  @user.updating_password = true
	end

	def create
	  @user = User.new(params[:user])
	  
	  @user.updating_password = true
	  if @user.save
	    session[:user_id] = @user.id
	 
		redirect_to "/set_profile"
	    #redirect_to "/edit_profile"
	    #redirect_to root_url, notice: "Thank you for signing up!"
	  else
	    render "new"

	  end
	end

	def set_profile
		@user = current_user
		@profile = @user.build_profile
	end

	def change_password
		@user = current_user
		@user.updating_password = true
	end

	def change_email
		@user = current_user
		@user.updating_password = true
	end

	def dashboard
		@user = current_user
		@activities = @user.activities
	end

	def update
		@user = current_user

	    if @user.update(user_params)
	    	redirect_to '/show_profile', notice: "Account Updated"
	      # Handle a successful update.
	    else
	      render 'change_password'
	    end
	end
	    #
	

 	private



    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :profile_attributes => [:first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :id])
    end


end
