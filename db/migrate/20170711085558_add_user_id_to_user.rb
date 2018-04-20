class AddUserIdToUser < ActiveRecord::Migration
  def change
    add_reference :employees, :user, index: true, foreign_key: true
  end
end
