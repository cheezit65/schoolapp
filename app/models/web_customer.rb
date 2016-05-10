class WebCustomer < ActiveRecord::Base
    
    validates :firstName, :lastName, :phone, :addressLine1, :city, :state, :postalcode, :email,  :presence => true
      has_many :WebOrders
    validates :email, email_format: { message: "doesn't look like an email address" }
    
end
