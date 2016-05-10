class ApplicationMailer < ActionMailer::Base
  default from: "donotreply@lugnuts.com"
  layout 'mailer'
  def order_email
    recipients    'fostershomeemail@yahoo.com'
    from          "My Awesome Site Notifications <notifications@example.com>"
    subject       "Welcome to My Awesome Site"
    sent_on       Time.now
  end
end
