class OrderMailer < ApplicationMailer
          


def order_confirmation(web_customer, orderNum, web_order_details)
        @web_customer = web_customer
        @orderNum = orderNum
        @web_order_details = web_order_details
        @products = Product.all
        @greeting = "Thank you"
        mail to: web_customer.email, subject: "Thank you for placing your order with Lugnuts Automotive"
    end
    def order_fulfillment(web_customer, orderNum, web_order_details, creditcardinfo)
    @web_customer = web_customer
        @orderNum = orderNum
        @web_order_details = web_order_details
        @products = Product.all
        @greeting = "New Order"
        mail to: "lugnutsorderfulfillment@yahoo.com", subject: "New Order Received through Website"
    end
end
