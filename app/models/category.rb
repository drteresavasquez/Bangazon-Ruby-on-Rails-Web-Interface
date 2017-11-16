class Category < ApplicationRecord
  scope by_name  order(:category_name)
end
