class WishListProduct < ApplicationRecord
	belongs_to :wish_lists
    validates :wishlist_id, :product_id, :presence => true
end
