class RemoveAppointmentDateFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointmentDate, :datetime
  end
end
