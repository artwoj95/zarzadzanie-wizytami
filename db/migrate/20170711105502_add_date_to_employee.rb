class AddDateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :date, :datetime
  end
end
