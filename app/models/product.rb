class Product < ActiveRecord::Base
	has_many :order_items
	belongs_to :subcategory
	belongs_to  :cart

  mount_uploader :image, ImageUploader 
  belongs_to :order
end
