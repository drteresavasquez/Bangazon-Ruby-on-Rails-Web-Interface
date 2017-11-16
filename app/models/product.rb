class Product < ApplicationRecord
  validates :quantity, :price, numericality: { :greater_than_or_equal_to => 0  }
  validates :product_name, :description, :price, :exp_date, presence: true
  validate :exp_date_after_now?

  def exp_date_after_now?
    if exp_date
      if exp_date < Date.today
        errors.add :exp_date, "Your expiration date must be after today"
      end
    end
  end

end
