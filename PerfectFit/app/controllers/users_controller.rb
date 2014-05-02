class UsersController < ApplicationController
	
	before_filter :authorize, only: [ :change_email, :set_profile, :dashboard, :update, :change_password, :distroy, :set_admin]



	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted."
	    redirect_to users_url
  	end

  	# responsible for the functionality of granting or removing admin priviledges 
  	# to other users. The logged in user must already be an admin for this functionality
  	# to be offered to them. If the user is not admin, they are redirected to their dashboard
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
	  @user = User.new
	  @user.updating_password = true
	  @user.updating_email = true

	end

	# Called when a new user is being created. If it is the first user of the site,
	# they are given admin priviledges.
	def create
	  @user = User.new(params[:user])
	  @user.updating_password = true
	  @user.updating_email = true
	
	  
	  if @user.save
	    cookies.permanent[:auth_token] = @user.auth_token
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
		@user = current_user
		@profile = @user.build_profile
		
		
	end

	def report
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
	end

	# responsible for when the admin panel page is accessed, verifying that the 
	# logged in user is an admin. Otherwise, it redirects the user to their dashboard
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
		@user = current_user
	end

	def dashboard
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
	end

	# When a user is logged in, trying to access the homepage of the website redirects
	# them to their dashboard
	def home_page
		if(current_user)
			redirect_to "/dashboard"
		else
			redirect_to "/home"
		end
	end

	# When a user is created, we want them to receive a welcome email to the email 
	# address they used to sign up. This is also the same function executed when a 
	# profile is updated. To differentiate the results, it is checked whether any
	# activities have been entered (which means you have not used the application 
	# before)
	# In retrospect there is a more sophisticated way to ensure that users are not 
	# sent welcome emails more than once.
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
      params.require(:user).permit(:email, :password, :password_confirmation, :admin, :profile_attributes => [:first_name, :last_name, :age, :gender, :weight, :zipcode, :birthday, :user_id, :id, :time_zone, :height, :feet, :inches])
    end


end
