class AddFieldsToWebCustomer < ActiveRecord::Migration
  def change
    add_column :web_customers,  :firstName, :string
    add_column :web_customers,  :lastName, :string
    add_column :web_customers,  :phone, :string
    add_column :web_customers,  :addressLine1, :string
    add_column :web_customers,  :addressLine2, :string
    add_column :web_customers,  :city, :string
    add_column :web_customers,  :state, :string
    add_column :web_customers,  :postalcode, :string
    add_column :web_customers,  :country, :string
    
  end
end
