require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = Product.new(product_name: "Example Product", description: "Test",
    price: 12.99, quantity: 5, local: false, exp_date: Date.tomorrow)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.product_name = ''
    assert_not @product.valid?
  end
end
