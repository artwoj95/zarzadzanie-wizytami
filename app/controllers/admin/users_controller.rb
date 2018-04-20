module Admin
	class UsersController < BaseController
		def index
			@user = current_user
		end

		def destroy
	    	@user = User.find(params[:id])
	    	if current_user.admin? "admin"
	      		@user.destroy
	      		redirect_to admin_user_user_list_path(@user)
	    	end
  		end

		def change_user_type
    		@user = User.find(params[:user_id])
    		if current_user.admin?
      			@user.type = params[:form]
    		end
    		if @user.save
      			redirect_to admin_user_user_list_path(@user)
    		end
  		end

  	def user_list
   		@users = User.all
  	end

  	def become
	    return unless current_user.admin?
	    sign_in(:user, User.find(params[:user_id]))
	    redirect_to root_path, notice: "Zalogowales sie"
  	end

	end
end