class AddEmailToWebCustomer < ActiveRecord::Migration
  def change
    add_column :web_customers, :email, :string, unique: true
    end
end
