class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	# belongs_to :order

  def product_price
  	product.price.to_f * quantity.to_f
  end
end