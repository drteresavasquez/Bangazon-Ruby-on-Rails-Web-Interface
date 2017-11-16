class WishList < ApplicationRecord
	belongs_to :users
	has_many :wish_list_products
	has_many :products, :through => :wish_list_products
    validates :user_id, :wishlist_name, :presence => true
end
