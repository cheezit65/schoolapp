class WebOrderDetailsController < ApplicationController
  before_action :set_web_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /web_order_details
  # GET /web_order_details.json
  def index
    @web_order_details = WebOrderDetail.all
  end

  # GET /web_order_details/1
  # GET /web_order_details/1.json
  def show
  end

  # GET /web_order_details/new
  def new
    @web_order_details = WebOrderDetail.new
  end

  # GET /web_order_details/1/edit
  def edit
  end

  # POST /web_order_details
  # POST /web_order_details.json
  def create
    @web_order_detail = WebOrderDetail.new(@line_item)
    respond_to do |format|
      if @web_order_detail.save
        format.html { redirect_to @web_order_detail, notice: 'Web order detail was successfully created.' }
        format.json { render :show, status: :created, location: @web_order_detail }
      else
        format.html { render :new }
        format.json { render json: @web_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /web_order_details/1
  # PATCH/PUT /web_order_details/1.json
  def update
    respond_to do |format|
      if @web_order_detail.update(web_order_detail_params)
        format.html { redirect_to @web_order_detail, notice: 'Web order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @web_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_order_details/1
  # DELETE /web_order_details/1.json
  def destroy
    @web_order_detail.destroy
    respond_to do |format|
      format.html { redirect_to web_order_details_url, notice: 'Web order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_order_detail
      @web_order_detail = WebOrderDetail.(@line_item)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_order_detail_params
     params.require(:product_id, :quantity, ).permit()
    end
