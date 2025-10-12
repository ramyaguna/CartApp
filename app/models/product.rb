class Product < ActiveRecord::Base
	has_many :order_items, through: :orders
	belongs_to :sub_category
	belongs_to  :cart, optional: true

  mount_uploader :image, ImageUploader 
  belongs_to :order, optional: true
end