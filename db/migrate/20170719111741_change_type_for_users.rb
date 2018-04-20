class ChangeTypeForUsers < ActiveRecord::Migration
  def change
  	change_column :users, :type, :string, default: "customer"
  end
end
