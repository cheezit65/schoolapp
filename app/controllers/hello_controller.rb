class HelloController < ApplicationController
  def index
    belongs_to :user
   end
   def Goodbye
    @customers = Customer.all
    @products = Product.all
    @blogs = Blog.all
    @lugs = Lug.all
    @carts = Cart.all
     @line_items = LineItem.all
      def count
     @line_items = LineItem.all.count
  end
  end
  
end
