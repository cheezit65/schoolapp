class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 include SessionsHelper
 
  # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
  # If your model is called User
  


  def index
   @cart = current_cart
    @line_items = LineItem.all
  end
  def count
     @line_items = LineItem.all.count
     @cartCount = Cart.all.count
  end
  def create
   @cart = current_cart
   product = Product.find(params[:product_id])
   @line_item = @cart.add_product(product.id)
   @line_item.product = product
   

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_url, notice: 'Line item was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

private
def current_cart
  Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  cart = Cart.create
  session[:cart_id] = cart.id
  cart
end
  
end
