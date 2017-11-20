class PaymentType < ApplicationRecord
	# has_many :users
	# belongs_to :orders
    VALID_CC_REGEX = /[\d]/

    validates :user_id, :account_name, :exp_date,:presence => true
    validates :account_number, presence: true,
              length: { must_equal: 16 },
              format: { with: VALID_CC_REGEX },
              uniqueness: true
    validate :exp_date_after_now?


    def exp_date_after_now?
        if exp_date
            if exp_date < Date.today
                errors.add :exp_date, "Your expiration date must be after today"
            end
        end
    end
end
