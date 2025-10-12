class Order < ActiveRecord::Base
	has_many :order_items
	has_many :products
	belongs_to :user
	has_many :products, through: :order_items

	scope :pending, -> { where(status: 'pending') }
end