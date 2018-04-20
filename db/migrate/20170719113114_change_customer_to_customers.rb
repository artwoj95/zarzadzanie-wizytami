class ChangeCustomerToCustomers < ActiveRecord::Migration
  def change
  	rename_table :customer, :customers
  end
end
