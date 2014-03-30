class UsersController < ApplicationController
	@@SWE = true
	
	before_filter :authorize, only: [ :set_profile, :dashboard, :update, :change_password]

	def new
	  @@SWE = true
	  @user = User.new
	  @user.updating_password = true
	  @@SWE = true
	end

	def create
	  @user = User.new(params[:user])
	  @@SWE = true
	  @user.updating_password = true
	  if @user.save
	    cookies.permanent[:auth_token] = @user.auth_token
	    @@SWE = true
		redirect_to "/set_profile"
	    #redirect_to "/edit_profile"
	    #redirect_to root_url, notice: "Thank you for signing up!"
	  else
	    render "new"

	  end
	end

	def set_profile
		@@SWE = true
		@user = current_user
		@@SWE = true
		@profile = @user.build_profile
		@@SWE = true
		
		
	end

	def change_password
		@@SWE = false
		@user = current_user
		@user.updating_password = true
		@@SWE = false

	end

	def change_email
		@@SWE = false
		@user = current_user
		@user.updating_password = true
		@@SWE = false
	end

	def dashboard
		@@SWE = false
		@user = current_user
		user = current_user
		@activities = @user.activities
		if(params[:display])
			user.display_time = Date.parse("#{params[:display]}")
		else
			user.display_time = 1.weeks.ago
		end
		@@SWE = false
	end

	def home_page
		if(current_user)
			redirect_to "/dashboard"
		else
			redirect_to "/home"
		end
	end

	def update
		@user = current_user
	    if @user.update(user_params)
	    	if @@SWE
	    		@user.send_welcome_message
	    		redirect_to "/dashboard?display=#{1.weeks.ago}", notice: "Welcome!"
	    	else
	    		redirect_to '/show_profile', notice: "Account Updated"
	    	end
	      # Handle a successful update.
	    else
	      render 'change_password'
	    end
	end
	    #
	

 	private



    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :profile_attributes => [:first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :id, :time_zone])
    end


end
