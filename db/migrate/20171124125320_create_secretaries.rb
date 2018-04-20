class CreateSecretaries < ActiveRecord::Migration
  def change
    create_table :secretaries do |t|

      t.timestamps null: false
    end
  end
end
