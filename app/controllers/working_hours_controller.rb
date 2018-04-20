class WorkingHoursController < ApplicationController
  before_action :authenticate_user!
  before_action :set_select_hours, only: %i[edit update new create]
  before_action :set_employee,     only: %i[edit update index new create destroy]
  before_action :set_hour, only: %i[edit update destroy]

  def index
    @hours = @employee.working_hours
  end

  def show
  end


  def new
    @hour = @employee.working_hours.new
  end

  def edit
  end


  def create
    @hour = @employee.working_hours.new(working_hour_params)
    correct_lp(@hour)
    if @hour.save
      redirect_to employee_working_hours_path(@employee), notice: 'Added'
    else
      render :new
    end
  end

  def update
    if @hour.update(working_hour_params)
      redirect_to employee_working_hours_path(@employee)
    else
      render :edit
    end
  end


  def destroy
    @hour.destroy
    redirect_to employee_working_hours_path(@employee)
  end

  private
    def set_working_hour
    end

    def set_select_hours
      @select_hours = (0..12).flat_map do |index|
        ["#{07 + index}:00", "#{07 + index}:30"]
      end
    end

    def set_employee
      @employee = current_user.employee
    end

    def set_hour
      @hour = @employee.working_hours.find(params[:id])
    end

    def working_hour_params
      params.require(:working_hour).permit(:day, :start_hour, :end_hour)
    end


    def correct_lp(hour)
      if hour.day == "monday"
        hour.lp = 1
      elsif hour.day == "tuesday"
        hour.lp = 2
      elsif hour.day == "wednesday"
        hour.lp = 3
      elsif hour.day == "thursday"
        hour.lp = 4
      elsif hour.day == "friday"
        hour.lp = 5
      end
    end

    def correct?
      (start_hour.to_i - end_hour.to_i) > 0
    end

end
