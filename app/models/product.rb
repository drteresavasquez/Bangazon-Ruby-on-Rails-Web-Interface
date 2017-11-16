class Product < ApplicationRecord
  validates :quantity > 0
  validates :active, :product_name, :description, :price, :local, :exp_date, presence: true
  validates :active, :local, inclusion: { in: [true, false] }
	validates :seller_id, :category_id, :product_name, :presence => true
	has_many :users
	has_many :products_votes
	has_many :users, :through => :products_votes
	belongs_to :categories
	has_many :wish_list_products

end
