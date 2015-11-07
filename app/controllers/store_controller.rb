class StoreController < ApplicationController
	skip_before_action :authorize
  def index
  	@products = Product.order(:name)
  end

end
