class CreditCard < ActiveRecord::Base
    belongs_to :web_customers
     validates :number,  :presence => true
      has_many :WebOrders
     validates_format_of :number, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
      
      end
