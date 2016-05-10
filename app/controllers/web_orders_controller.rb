class WebOrdersController < ApplicationController
  
  # GET /web_orders
  # GET /web_orders.json
  def index
    @web_orders = WebOrder.all
     @products = Product.all
    @carts = Cart.all
    @line_items = LineItem.all
  end
createOrder
    @products = Product.all
    @carts = Cart.all
    @line_items = LineItem.all
    @web_order_detail.create(@line_items)
    
  
  # GET /web_orders/1
  # GET /web_orders/1.json
  def show
   @web_customers = WebCustomer.all
   @web_orders = WebOrder.all
   @products = Product.all
   @carts = Cart.all
   @line_items = LineItem.all
   @grandTotal = 0
   
  end

  # GET /web_orders/new
  def new
    @web_order = WebOrder.new
    @carts = Cart.all
    @line_items = LineItem.all
  end

  # GET /web_orders/1/edit
  def edit
  end

  # POST /web_orders
  # POST /web_orders.json
  def create
    respond_to do |format|
      if @web_order.save
        format.html { redirect_to @web_order, notice: 'Web order was successfully created.' }
        format.json { render :show, status: :created, location: @web_order }
      else
        format.html { render :new }
        format.json { render json: @web_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_orders/1
  # PATCH/PUT /web_orders/1.json
  def update
    respond_to do |format|
      if @web_order.update(web_order_params)
        format.html { redirect_to @web_order, notice: 'Web order was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_order }
      else
        format.html { render :edit }
        format.json { render json: @web_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_orders/1
  # DELETE /web_orders/1.json
  def destroy
    @web_order.destroy
    respond_to do |format|
      format.html { redirect_to web_orders_url, notice: 'Web order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_order
      @web_order = WebOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_order_params
      params.fetch(:web_order, {})
    end
end
