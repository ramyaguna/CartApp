class Product < ActiveRecord::Base
	has_many :order_items
	belongs_to :sub_category
	belongs_to  :cart

  mount_uploader :image, ImageUploader 
  belongs_to :order
end