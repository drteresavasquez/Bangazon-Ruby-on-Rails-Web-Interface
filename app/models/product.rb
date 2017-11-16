class Product < ApplicationRecord
	has_many :users
	has_many :products_votes
	has_many :users, :through => :products_votes
	belongs_to :categories
    validates :seller_id, :category_id, :product_name, :presence => true

end
