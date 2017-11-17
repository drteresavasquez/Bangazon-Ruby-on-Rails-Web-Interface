
class ProductsController < ApplicationController

  # Show user products
  def index
    @current_user_prods = Product.where(seller_id: 3)

    # make a call to the OrdersProducts table and compare the product_id with the @current_user_prods.id, then count how may products are in each batch to get the total sold for each item

    # @number_sold = Product.includes("orders").where(first_name: 'Ryan', orders: { status: 'received' }).count
    @number_sold = OrdersProduct.where(:product_id => @current_user_prods.ids).group(:product_id).count

    
  end

    def show
        @product = Product.find(params[:id])
        @seller = User.find(@product.seller_id)
    end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product was created!"
      redirect_to @product
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :quantity, :description,
                                 :price, :local, :category_id, :exp_date,
                                  :active => true)

  end
end

