class RemoveDateFromEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :date, :datetime
  end
end
