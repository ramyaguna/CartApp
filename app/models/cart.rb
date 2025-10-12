class Cart < ActiveRecord::Base
	has_many :order_items, dependent: :destroy
	# has_many :products
	belongs_to :user
	# belongs_to :order, optional: true
  
  def add_product(params)
    order_item = order_items.find_by(product_id: params[:product_id])
    if order_item
      order_item.quantity += 1
    else
      # order_item = order_items.build(product_id: product.id, quantity: 1)
      order_item = order_items.build(product_id: params[:product_id], price: params[:price], total: params[:price], quantity: "1")
    end
    order_item
  end

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end

	def grand_total
  	  grand_total=0
  	  self.order_items.each do |item|
  	  grand_total += item.product_price
	end
  	grand_total
  end

end