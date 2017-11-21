class ProductsController < ApplicationController
  include SessionsHelper

  def show
    @product = Product.find(params[:id])
    @seller = User.find(@product.seller_id)
  end

  # @build   takes id->city of current user, searches products from users from same city
  # @params  none
  # @return  no return, creates array of products matching SQL query
  def show_local
    current_city = current_user[:city].titleize
    local_sellers = Array.new
    @local_products = Array.new
    User.where(:city => current_city).find_each do |user, index|
      local_sellers.push(user.id)
    end

    local_sellers.each do |id|
      @local_products.push(Product.where("seller_id = ? AND local = ?", id, true))
    end
  end

   # Show user products
  def index
    @current_user_prods = Product.where(seller_id: current_user.id)

    # make a call to the OrdersProducts table and compare the product_id with the @current_user_prods.id, then count how may products are in each batch to get the total sold for each item
    @number_sold = OrdersProduct.where(:product_id => @current_user_prods.ids).group(:product_id).count
  end

  # @build  instantiates Product object, creates collection of all categories
  # @params
  # @return
  def new
    @product = Product.new
    @categories = Category.all
  end

  # @build  creates a new product
  # @params  product params from product#new field
  # @return  redirects to product_path
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

  # @build  deletes a product from the database
  # @params  id of product to delete
  # @return  redirects to myproducts_path
  def destroy
      @product = Product.find(params[:id])
      @product.destroy

      redirect_to myproducts_path
  end


  private
    # @build  makes product fields editable by user
    # @params
    # @return  params
    def product_params
      params.require(:product).permit(:product_name, :quantity, :description,
                                   :price, :local, :category_id, :exp_date,
                                    :active, :seller_id, :picture)

    end

end
