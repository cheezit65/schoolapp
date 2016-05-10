class AboutController < ApplicationController
  def Us
        @carts = Cart.all
    @line_items = LineItem.all
  end
  def count
     @line_items = LineItem.all.count
  end
end
