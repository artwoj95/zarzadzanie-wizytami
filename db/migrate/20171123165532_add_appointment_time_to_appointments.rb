class AddAppointmentTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointmentTime, :string
  end
end
