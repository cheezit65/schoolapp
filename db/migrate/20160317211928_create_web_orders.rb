class CreateWebOrders < ActiveRecord::Migration
  def change
    create_table :web_orders do |t|

      t.timestamps null: false
    end
  end
end
