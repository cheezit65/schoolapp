class CreateWebCustomers < ActiveRecord::Migration
  def change
    create_table :web_customers do |t|

      t.timestamps null: false
    end
  end
end
