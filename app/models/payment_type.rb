class PaymentType < ApplicationRecord
	# has_many :users
	# belongs_to :orders
    validates :user_id, :account_name, :account_number, :exp_date,:presence => true

end
