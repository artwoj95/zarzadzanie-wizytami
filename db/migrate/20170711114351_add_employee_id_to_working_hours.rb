class AddEmployeeIdToWorkingHours < ActiveRecord::Migration
  def change
    add_reference :working_hours, :employee, index: true, foreign_key: true
  end
end
