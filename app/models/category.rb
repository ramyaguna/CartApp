class Category < ActiveRecord::Base
 has_many :sub_categories
 mount_uploader :image, ImageUploader
 # belongs_to :user
end
