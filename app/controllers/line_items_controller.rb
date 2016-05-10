class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    @products = Product.all
    @carts = Cart.all

  end
  def count
     @line_items = LineItem.all.count
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_items = LineItem.all
    @carts = Cart.all
end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
    @carts = Cart.all
    @line_items = LineItem.find(params[:id])
    @line_items.update_attributes(:cart_id => (params[:cartid]))
    redirect_to @line_item
  end

  # POST /line_items
  # POST /line_items.json
  def create
   @cart = current_cart
   product = Product.find(params[:product_id])
   @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to :back, notice: 'Your cart has been updated.' }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @cart = current_cart
    @lineitem = params[:item]
    newquantity = @lineitem[:quantity]
    @line = LineItem.find(params[:id])
    @line.update_attributes(:quantity => newquantity)
    redirect_to :back
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Your cart has been updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :id, :cart_id, :quantity)
    end
end
