class Product < ApplicationRecord
  validates :quantity > 0
  validates :product_name, :description, :price, :local, :exp_date, presence: true
  validates :local, inclusion: { in: [true, false] }

end
