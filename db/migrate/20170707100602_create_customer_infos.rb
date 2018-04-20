class CreateCustomerInfos < ActiveRecord::Migration
  def change
    create_table :customer_infos do |t|

      t.timestamps null: false
    end
  end
end
