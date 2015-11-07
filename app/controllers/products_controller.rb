class ProductsController < ApplicationController

	before_filter :find_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product
		@products = @products.where("price >= ?", params[:price_from]) if params[:price_from]
		@products = @products.order("price").limit(50)
	end

	def who_bought
		@product = Product.find(params[:id])
		@latest_order = @product.orders.order(:updated_at).last
		if stale?(@laatest_order)
			respond_to do |format|
				format.atom
			end
		end
	end

	def show
		@product = Product.find(params[:id])
		unless @product
			render text: "Page not found", status: 404
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(products_params)
		if @product.errors.empty?
			redirect_to product_path(@product)
		else
			render "new"
		end
	end

	def edit
	end

	def update
		@product.update_attributes(products_params)
		if @product.errors.empty?
			flash[:success] = "Product successfully updated!"
			redirect_to product_path(@product)
		else
			flash.now[:error] = "You made mistakes in your form! Please correct them"
			render "edit"
		end
	end

	def destroy
		@product.destroy
		redirect_to action: "index"
	end

	def find_product
		@product = Product.where(id: params[:id]).first
		render_404 unless @product
	end

	def products_params
		params.require(:product).permit(:name, :price, :weight, :description, :attachment)
	end
end
