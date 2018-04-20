class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee
  before_action :set_user, except: [:show]

  def index
    @employee = @user.employee
  end

  def show
    if current_user.admin?
      @admin = current_user
      @employee = Employee.find(params[:id])
      @user = User.find(@employee.user_id)
    else
      redirect_to root_path, notice: "You're not admin"
    end
  end


  def new
    @employee = @user.build_employee
  end

  def edit
    @employee = @user.employee
  end

  def create
    @employee = @user.build_employee(employee_params)
    if @employee.save
      redirect_to root_path, notice: 'Created'
    else
      render :new
    end
  end


  def update
    @employee = @user.employee
    if @employee.update(employee_params)
      redirect_to root_path, notice: 'Updated'
    else
      render :edit
    end
  end


  def destroy
    
  end

  def appointments
    @employee = @user.employee
    @appointments = Appointment.all.includes(:customer).where(employee_id: @employee.id)
  end

  def calendar
    @employee = @user.employee
    @appointments = Appointment.where(employee_id: @employee.id)
    @merged_date = {"id" => "date"}
    @appointments.each do |appointment|
      @merged_date[appointment.id] = "#{appointment.appointment_date}T#{appointment.appointment_time}:00"
    end
  end


  private
    def set_employee
    end

    def set_user
      @user = current_user
    end

    def authenticate_employee
      redirect_to root_path, notice: "You're not employee" unless current_user.employee? || current_user.admin?
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :telephone_number, 
        :position)
    end
end
