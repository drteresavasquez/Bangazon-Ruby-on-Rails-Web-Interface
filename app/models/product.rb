class Product < ApplicationRecord
  validates :quantity,  numericality: { :greater_than_or_equal_to => 0  }
  validates :price, numericality: { :less_than_or_equal_to => 10000 }
  validates :product_name, :description, :price, :exp_date, presence: true
  validate :exp_date_after_now?


  def exp_date_after_now?
    if exp_date
      if exp_date < Date.today
        errors.add :exp_date, "Your expiration date must be after today"
      end
    end
  end

	has_many :users
	has_many :products_votes
	has_many :users, :through => :products_votes
	# belongs_to :categories
	has_many :wish_list_products

end
