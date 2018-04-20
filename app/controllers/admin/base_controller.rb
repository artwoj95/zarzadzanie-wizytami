module Admin
	class BaseController < ApplicationController
		before_action :authenticate_admin

		def index
			
		end

		private

			def authenticate_admin
				redirect_to root_path, notice: "You're not admin" unless current_user.admin?
			end
	end
end