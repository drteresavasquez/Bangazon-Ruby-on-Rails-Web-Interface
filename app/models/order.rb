class Order < ApplicationRecord
	has_many :users
	has_many :orders_products
	has_many :products, :through => :orders_products
    validates :user_id, :presence => true

end
