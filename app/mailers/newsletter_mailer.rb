class NewsletterMailer < ApplicationMailer
    
    
def newsy_confirmation(web_customer)
        @web_customer = web_customer
        mail to: web_customer.email, subject: "Lugnuts Newsletter"
    end
end
