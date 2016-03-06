class HelloController < ApplicationController
  def index
   end
   def Goodbye
    @customers = Customer.all
    @products = Product.all
    @blogs = Blog.all
    @lugs = Lug.all
  end
end
