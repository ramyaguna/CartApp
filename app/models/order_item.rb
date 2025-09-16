class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	
  def product_price
  	product.price.to_f * quantity.to_f
  end
end