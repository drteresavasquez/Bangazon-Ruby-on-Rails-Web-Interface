class Product < ApplicationRecord
  validates :quantity > 0
  validates :active, :product_name, :description, :price, :local, :exp_date, presence: true
  validates :active, :local, inclusion: { in: [true, false] }

end
