class ProductsVote < ApplicationRecord
	belongs_to :users
	belongs_to :products
    validates :product_id, :customer_id, :presence => true

end
