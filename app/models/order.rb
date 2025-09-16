class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products
  belongs_to :user	
end
