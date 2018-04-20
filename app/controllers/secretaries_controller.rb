class SecretariesController < ApplicationController
  before_action :set_secretary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_secretary

  def index
    @user = current_user
    @secretary = @user.secretary
  end


  def show
    if current_user.admin?
      @admin = current_user
      @secretary = Secretary.find(params[:id])
      @user = User.find(@secretary.user_id)
    else
      redirect_to root_path, notice: "You're not admin"
    end
  end

 
  def new
    @secretary = current_user.build_secretary
  end

  def edit
    @secretary = current_user.secretary
  end


  def create
    @secretary = current_user.build_secretary(secretary_params)
    if @secretary.save
      redirect_to root_path, notice: "Created"
    else
      render :new
    end
  end

  
  def update
    @secretary = current_user.secretary
    if @secretary.update(secretary_params)
      redirect_to root_path, notice: "Updated"
    else
      render :edit
    end
  end

  
  def destroy
    
  end

  def appointments
    @status = params[:status]
    @secretary = current_user.secretary
    @appointments = Appointment.where(confirmation: view_context.wait_or_confirmed?(@status))
    @employee_name = {"appid" => "fullname"}
    @customer_name = {"appid" => "fullname"}
    @appointments.each do |appointment|
      @employee = User.find(Employee.find(appointment.employee_id).user_id)
      @customer = User.find(Customer.find(appointment.customer_id).user_id)
      @employee_name[appointment.id] = "#{@employee.first_name} #{@employee.last_name}"
      @customer_name[appointment.id] = "#{@customer.first_name} #{@customer.last_name}"
    end
  end

  def calendar
    @status = params[:status]
    @secretary = current_user.secretary
    @appointments = Appointment.where(confirmation: view_context.wait_or_confirmed?(@status))
    @merged_date = {"id" => "date"}
    @appointments.each do |appointment|
      @merged_date[appointment.id] = "#{appointment.appointment_date}T#{appointment.appointment_time}:00"
    end
  end

  def expired_date
    @appointments = Appointment.all
    @deleted = false
    unless @appointments.empty?
      @appointments.each do |appointment|
        if appointment.appointment_date < Date.today
          appointment.destroy
          @customer = Customer.find(appointment.customer_id)
          UserMailer.declined_appointment(@customer, appointment).deliver_now
          @deleted = true
        end
      end
    end
    redirect_to root_path, notice: @deleted ? "All expired appointments has beed deleted" : "There was no expired appointments"
  end

  private
    def set_secretary

    end

    def authenticate_secretary
      redirect_to root_path, notice: "You're not secretary" unless current_user.secretary? || current_user.admin?
    end
  
    def secretary_params
      params.require(:secretary).permit(:first_name, :last_name, :telephone_number)
    end
end
