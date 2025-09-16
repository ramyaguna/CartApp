class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @order_items=OrderItem.all
  end

  def show
  end

 def find_total
   @order =OrderItem.find params[:order_id]
   @order.update_attributes(:quantity => params[:quantity],:total => params[:total],:price => params[:price])
   render nothing: true 
 end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :price, :total, :product_id, :cart_id)
  end
end
