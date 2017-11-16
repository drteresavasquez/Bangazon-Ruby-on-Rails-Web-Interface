class Image < ApplicationRecord
	belongs_to :products
	validates :product_id, :picture, :presence => true
end
