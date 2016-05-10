class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :product_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
