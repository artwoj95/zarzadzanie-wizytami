class HomeController < ApplicationController
  def index
  	@user = current_user
    if @user
      @customer = @user.customer
      @employee = @user.employee
      @secretary = @user.secretary
    end

    unless @user.nil?
      if @user.admin?
        redirect_to admin_users_path
      elsif @user.customer?
        redirect_to customers_path
      elsif @user.employee?
        redirect_to employees_path
      elsif @user.secretary?
        redirect_to secretaries_path
      end
    end
  end

end
