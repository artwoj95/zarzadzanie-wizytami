class AddColumnsToSecretaries < ActiveRecord::Migration
  def change
    add_column :secretaries, :first_name, :string
    add_column :secretaries, :last_name, :string
    add_column :secretaries, :telephone_number, :string
  end
end
