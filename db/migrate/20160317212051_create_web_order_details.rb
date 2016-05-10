class CreateWebOrderDetails < ActiveRecord::Migration
  def change
    create_table :web_order_details do |t|

      t.timestamps null: false
    end
  end
end
