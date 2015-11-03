class LinaItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_lina_item, only: [:show, :edit, :update, :destroy]

  # GET /lina_items
  # GET /lina_items.json
  def index
    @lina_items = LinaItem.all
  end

  # GET /lina_items/1
  # GET /lina_items/1.json
  def show
  end

  # GET /lina_items/new
  def new
    @lina_item = LinaItem.new
  end

  # GET /lina_items/1/edit
  def edit
  end

  # POST /lina_items
  # POST /lina_items.json
  def create
    product = Product.find(params[:product_id])
    @lina_item = @cart.add_product(product.id)

    respond_to do |format|
      if @lina_item.save
        format.html { redirect_to @lina_item.cart }
        format.json { render :show, status: :created, location: @lina_item }
      else
        format.html { render :new }
        format.json { render json: @lina_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lina_items/1
  # PATCH/PUT /lina_items/1.json
  def update
    respond_to do |format|
      if @lina_item.update(lina_item_params)
        format.html { redirect_to @lina_item, notice: 'Lina item was successfully updated.' }
        format.json { render :show, status: :ok, location: @lina_item }
      else
        format.html { render :edit }
        format.json { render json: @lina_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lina_items/1
  # DELETE /lina_items/1.json
  def destroy
    @lina_item.destroy
    respond_to do |format|
      format.html { redirect_to lina_items_url, notice: 'Lina item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lina_item
      @lina_item = LinaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lina_item_params
      params.require(:lina_item).permit(:product_id)
    end
end