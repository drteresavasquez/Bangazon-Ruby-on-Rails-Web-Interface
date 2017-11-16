class Favorite < ApplicationRecord
	belongs_to  :users
	has_many :products, :through => :users
    validates :user_id, :customer_id, :presence => true
end
