class CartsController < ApplicationController
  before_action :authenticate_user! 
  # before_action :set_cart

  # def show 
  #   @cart = current_cart
  # end
    

     

  # private

  # def set_cart
  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id

  def new
    binding.pry
  	# @order_item = current_cart.order_items.build(product_id: params[:product_id], price: params[:price], total: params[:price], quantity: "1")
    @order_item = current_cart.add_product(params)
    if @order_item.save!
      redirect_to order_items_path, notice: 'Item added to cart!'
    else
      redirect_to product_path(product_id: params[:product_id]), alert: 'Could not add item to cart.'
    end
     
  end
end