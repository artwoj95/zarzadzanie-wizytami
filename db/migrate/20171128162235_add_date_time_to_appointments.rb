class AddDateTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_date, :date
    add_column :appointments, :appointment_time, :string
  end
end
