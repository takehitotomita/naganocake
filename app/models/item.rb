class Item < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	attachment :image
	def self.fetch_valid
		Item.where(is_active: true)
	end
end
