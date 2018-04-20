class RemoveAppointmentTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointmentTime, :time
  end
end
