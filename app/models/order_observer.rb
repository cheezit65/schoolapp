class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_order_email
  end
end