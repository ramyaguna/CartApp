class Cart < ActiveRecord::Base
	has_many :order_items
	belongs_to :user
	belongs_to :order

	def grand_total
  	grand_total=0
  	self.order_items.each do |item|
  		grand_total += item.product_price
  	end
  	grand_total
  end
end
