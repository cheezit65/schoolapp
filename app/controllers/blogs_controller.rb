class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.order(created_at: :desc)
    @lugs = Lug.order(created_at: :desc)
        @carts = Cart.all
    @line_items = LineItem.all

  end
  def count
     @line_items = LineItem.all.count
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blogs = Blog.order(created_at: :desc)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @blogs = Blog.order(created_at: :desc)
    @lugs = Lug.order(created_at: :desc)
        @carts = Cart.all
    @line_items = LineItem.all
  end

  # GET /blogs/1/edit
  def edit
        @carts = Cart.all
    @line_items = LineItem.all

  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to :back}
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :back }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to :back, notice: 'Blog was successfully updated.' }
        format.json { render :back, status: :ok, location: @blog }
      else
        format.html { render :back }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :lugref)
    end
end
