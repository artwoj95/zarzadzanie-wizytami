class AddFieldsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :position, :string
    add_column :employees, :telephone_number, :string
  end
end
