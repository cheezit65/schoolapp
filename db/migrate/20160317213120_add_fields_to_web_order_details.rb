class AddFieldsToWebOrderDetails < ActiveRecord::Migration
  def change
    add_column :web_order_details, :orderNumber, :integer
    add_column :web_order_details, :productCode, :string
    add_column :web_order_details, :quantityOrdered, :integer
    add_column :web_order_details, :buyPrice, :integer
    add_column :web_order_details, :orderLineNumber, :integer
  end
end
