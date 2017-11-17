class WishListProduct < ApplicationRecord
	# belongs_to :wish_lists
	# belongs_to :products
    validates :wishlist_id, :product_id, :presence => true
end
