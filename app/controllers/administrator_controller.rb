class AdministratorController < ApplicationController
  def index
  	@total_orders = Order.count
  end
end
