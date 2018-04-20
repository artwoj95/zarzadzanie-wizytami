class AddFieldsToCustomerInfo < ActiveRecord::Migration
  def change
    add_column :customer_infos, :first_name, :string
    add_column :customer_infos, :last_name, :string
    add_column :customer_infos, :telephone_number, :string
    add_column :customer_infos, :city, :string
    add_column :customer_infos, :pesel, :string
  end
end
