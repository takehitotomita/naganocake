class Genre < ApplicationRecord
	has_many :items, dependent: :destroy
	def self.fetch_valid
		Genre.where(is_active: true)
	end
end
