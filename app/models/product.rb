class Product < ApplicationRecord
  validates :quantity, numericality: { :greater_than_or_equal_to => 0  }
  validates :product_name, :description, :price, :local, :exp_date, presence: true
  validates :local, inclusion: { in: [true, false] }

end
