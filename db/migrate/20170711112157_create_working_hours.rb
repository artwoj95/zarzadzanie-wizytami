class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.integer :lp
      t.string :day
      t.string :start_hour
      t.string :end_hour

      t.timestamps null: false
    end
  end
end
