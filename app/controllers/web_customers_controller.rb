class WebCustomersController < ApplicationController
  before_action :set_web_customer, only: [:show, :edit, :update, :destroy]

  # GET /web_customers
  # GET /web_customers.json
  def index
    @web_customers = WebCustomer.all
    @products = Product.all
    @carts = Cart.all
    @line_items = LineItem.all

  end

  # GET /web_customers/1
  # GET /web_customers/1.json
  def show
    @web_orders = WebOrder.find_by(customerNumber: params[:id])
    @orderNum = @web_orders.orderNumber
    @products = Product.all
    @line_items = LineItem.where(cart_id: session[:cart_id])
    
@line_items.each do |item|
@web_order_details = WebOrderDetail.new  
@web_order_details.quantityOrdered = item.quantity
@web_order_details.productCode = item.product_id
@web_order_details.orderNumber = @orderNum
@web_order_details.save
end  
current_cart.destroy
OrderMailer.order_confirmation(@web_customer, @orderNum, @web_order_details).deliver
OrderMailer.order_fulfillment(@web_customer, @orderNum, @web_order_details, @CreditCardInfo).deliver
NewsletterMailer.newsy_confirmation(@web_customer).deliver
end

  # GET /web_customers/new
  def new
    @web_customer = WebCustomer.new
    @products = Product.all
    @carts = Cart.all
    @line_items = LineItem.all
  end

  # GET /web_customers/1/edit
  def edit
  end

  # POST /web_customers
  # POST /web_customers.json
    def count
     @line_items = LineItem.all.count
  end

  def create
    @products = Product.all
    @carts = Cart.all
    @cart = current_cart
    @web_orders = WebOrder.all
    @web_customer = WebCustomer.new(web_customer_params)
    @web_order = WebOrder.new
    @line_items = LineItem.all
    respond_to do |format|
      @web_customer.user_id = params[:user_ID]
      if @web_customer.save
          
      else
        format.html { render :new }
        format.json { render json: @web_customer.errors, status: :unprocessable_entity }
      end
        @web_order.customerNumber = @web_customer.customerNumber        
        @web_order.save!
        format.html { redirect_to @web_customer, notice: 'Order successfully submitted.' }
        format.json { render :show, status: :created, location: @web_customer }
       
    end
  end

  # PATCH/PUT /web_customers/1
  # PATCH/PUT /web_customers/1.json
  def update
    respond_to do |format|
      if @web_customer.update(web_customer_params)
        format.html { redirect_to @web_customer, notice: 'Web customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_customer }
      else
        format.html { render :edit }
        format.json { render json: @web_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_customers/1
  # DELETE /web_customers/1.json
  def destroy
    
    @web_customer.destroy
    respond_to do |format|
      format.html { redirect_to web_customers_url, notice: 'Web customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_customer
      @web_customer = WebCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_customer_params
      params.require(:web_customer).permit(:firstName, :lastName, :phone, :addressLine1, :addressLine2, :city, :state, :postalcode, :email, :user_ID)
    end
    
    def emailOrder
  @web_order.customerNumber = @web_customer.customerNumber   
  @web_orders = WebOrder.find_by(customerNumber: params[:id])
  @orderNum = @web_orders.orderNumber
  OrderMailer.request_email(params[:email], @web_orders).deliver  
  end  
end
