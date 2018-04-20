class AddColumnsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :employee_id, :integer, default: "0"
    add_column :appointments, :customer_id, :integer, default: "0"
    add_column :appointments, :confirmation, :boolean, default: false
  end
end
