class UsersController < ApplicationController
	@@SWE = false
	
	before_filter :authorize, only: [ :change_email, :set_profile, :dashboard, :update, :change_password, :distroy, :set_admin]



	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted."
	    redirect_to users_url
  	end

  	def set_admin
  		if(current_user.admin)
			@user = User.find(params[:id]) #.update(params[:profile.first_name => "ADMIN HAHA"])
			if(@user.admin)
				@user.update_attributes(admin: false)
				flash[:error] = "User Set As Non-Admin."
			else
				@user.update_attributes(admin: true)
				flash[:error] = "User Set As Admin."
			end
			#@user.profile.first_name = "ADMIN"
		
			
	    	redirect_to users_url
	    else
	    	if(current_user)
				redirect_to "/dashboard"
			else
				redirect_to "/home"
			end
		end

	end

	def new
	  @@SWE = true
	  @user = User.new
	  @user.updating_password = true
	  @user.updating_email = true

	  @@SWE = true
	end

	def create
	  @user = User.new(params[:user])
	  @@SWE = true
	  @user.updating_password = true
	  @user.updating_email = true
	
	  
	  if @user.save
	    cookies.permanent[:auth_token] = @user.auth_token
	    @@SWE = true
	      if (@user.id = 1)
	  	@user.update_attributes(admin: true)
	  end
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

	def report
		@user = current_user
	end

	def index
    	@users = User.all
    	if(current_user.admin)

	    else
	    	if(current_user)
				redirect_to "/dashboard"
			else
				redirect_to "/home"
			end
		end
  	end


	def change_email_password
		@@SWE = false
		@user = current_user
		@@SWE = false
	end

	def dashboard
		@@SWE = false
		@user = current_user
		user = current_user
		@activities = @user.activities
		@healths = @user.healths
		@user.target = @user.profile.weight || nil
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
	    	if @user.activities.any?
	    		redirect_to '/show_profile', notice: "Account Updated"
	    	else
	    		@user.send_welcome_message
	    		redirect_to "/dashboard?display=#{1.weeks.ago}", notice: "Welcome!"
	    	end
	    else
	    		render 'change_email_password'
	          	
	    end
	end
	    #

	def show
		if(current_user.admin)
	   		@user = User.find(params[:id])
	   	else
	    	if(current_user)
				redirect_to "/dashboard"
			else
				redirect_to "/home"
			end
		end
  	end
	

 	private



    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin, :profile_attributes => [:first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :id, :time_zone])
    end


end
