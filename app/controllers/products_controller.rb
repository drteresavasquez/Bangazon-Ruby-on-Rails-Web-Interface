class ProductsController < ApplicationController
  include SessionsHelper

  def show
    @product = Product.find(params[:id])
    @seller = User.find(current_user.id)
  end

        # Show user products
  def index
    @current_user_prods = Product.where(seller_id: current_user.id)

    # make a call to the OrdersProducts table and compare the product_id with the @current_user_prods.id, then count how may products are in each batch to get the total sold for each item
    @number_sold = OrdersProduct.where(:product_id => @current_user_prods.ids).group(:product_id).count
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
      @categories = Category.all
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :quantity, :description,
                                 :price, :local, :category_id, :exp_date,
                                  :active, :seller_id, :picture)

  end
end
