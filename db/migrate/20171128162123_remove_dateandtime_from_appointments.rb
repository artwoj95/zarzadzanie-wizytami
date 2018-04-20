class RemoveDateandtimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointmentDate, :date
    remove_column :appointments, :appointmentTime, :string
  end
end
