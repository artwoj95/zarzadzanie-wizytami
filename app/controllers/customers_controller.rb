class CustomersController < ApplicationController
  before_action :authenticate_customer
  before_action :set_user, except: [:show]

  def index
    @customer = @user.customer
  end

  def show
    if current_user.admin?
      @admin = current_user
      @customer = Customer.find(params[:id])
      @user = User.find(@customer.user_id)
    else
      redirect_to root_path, notice: "You're not admin"
    end
  end

  def new
    @customer = @user.build_customer
  end

  def edit
    @customer = @user.customer
  end

  def create
    @customer = @user.build_customer(customer_params)
    if @customer.save
      redirect_to root_path, notice: 'Created'
    else
      render :new
    end
  end

  def update
    @customer = @user.customer
    if @customer.update(customer_params)
      redirect_to root_path, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
  end

  def search
    @employee = Employee.all
    @customer = @user.customer
  end

  def calendar
    @customer = @user.customer
    @appointments = Appointment.where(customer_id: @customer.id)
    @merged_date = {"id" => "date"}
    @appointments.each do |appointment|
      @merged_date[appointment.id] = "#{appointment.appointment_date}T#{appointment.appointment_time}:00"
    end
  end

  def employee
    @employee = Employee.find(params[:employee_id])
    @working_hours = @employee.working_hours
    @appointments = Appointment.where(employee_id: @employee.id).where(confirmation: true)
    @merged_date = {"id" => "date"}
    @appointments.each do |appointment|
      @merged_date[appointment.id] = "#{appointment.appointment_date}T#{appointment.appointment_time}:00"
    end
  end

  private
    def set_customer
    end

    def set_user
      @user = current_user
    end

    def authenticate_customer
      redirect_to root_path, notice: "You're not customer" unless current_user.customer? || current_user.admin?
    end

    def customer_params
      params.require(:customer).permit(:telephone_number, :city, :pesel)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
