class AddUserIdToSecretaries < ActiveRecord::Migration
  def change
    add_column :secretaries, :user_id, :integer
    add_index :secretaries, :user_id
  end
end
