class ContactController < ApplicationController
  def Us
    @blogs = Blog.order(created_at: :desc)
    @lugs = Lug.order(created_at: :desc)
        @carts = Cart.all
    @line_items = LineItem.all

  end
  def count
     @line_items = LineItem.all.count
  end
end
