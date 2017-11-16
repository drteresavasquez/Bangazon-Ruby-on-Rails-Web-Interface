class User < ApplicationRecord
	has_many :products
	has_many :products_votes
	has_many :products, :through => :products_votes
	has_many :favorites
	has_many :products, :through => :favorites
	has_many :orders
	has_many :payment_types
	has_one :wishlists
    validates :first_name, :last_name, :presence => true

end

