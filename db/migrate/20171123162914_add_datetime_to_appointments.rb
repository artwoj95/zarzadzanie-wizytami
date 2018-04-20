class AddDatetimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointmentDate, :date
    add_column :appointments, :appointmentTime, :time
  end
end
