class AddFieldsToWebOrder < ActiveRecord::Migration
  def change
    add_column :web_orders, :orderNumber, :integer
    add_column :web_orders, :orderDate, :integer
    add_column :web_orders, :shippedDate, :integer
    add_column :web_orders, :status, :string
    add_column :web_orders, :customerNumber, :integer
  end
end
