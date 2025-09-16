class CartsController < ApplicationController
  before_action :authenticate_user! 

  def index 
  end

  def new
  	current_cart.order_items.create(product_id: params[:product_id], price: params[:price], total: params[:price], quantity: "1")
    redirect_to order_items_path  
  end
end