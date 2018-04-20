class ChangeCustomerInfoToCustomer < ActiveRecord::Migration
  def change
  	rename_table :customer_infos, :customer
  end
end
