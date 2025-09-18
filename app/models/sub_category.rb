class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :products
	mount_uploader :image, ImageUploader
end