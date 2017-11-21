class CategoriesController < ApplicationController

  # @build  creates new Category or gets all Categories from db
  # @params  none
  # @return  none
  def new
    @category = Category.new
    @categories = Category.all.by_name
  end

  # @build  creates a new product category
  # @params  category name from form
  # @return  none, redirects to category_url
  def create
    @categories = Category.all.by_name
    @category = Category.new(category_params)
      if category.save
        flash[:success] = "New category created!"
        redirect_to @category
      end
  end

  # @build  edits a category in the databse
  # @params  id of the category
  # @return  none
  def edit
    @category = Category.find(params[:id])
    @categories = Category.all.by_name
  end

  # @build  shows all categories, gets all products, calls sort_products
  # @params  none
  # @return  a hash of all sorted products
  def index
      @categories = Category.all
      @products = Product.all
      sort_products
      @products_hash
  end


  # @build  finds one category, shows all products in category
  # @params  id of category
  # @return  none
  def show
      @category = Category.find(params[:id])
      @products = Product.all
  end


  private

    # @build  allows category_name to be editable by user
    # @params  none
    # @return  params
    def category_params
      params.require(:category).permit(:category_name)
    end

    # @build  creates a hash with category names as keys, products as values
    # @params  all products and categories from the db
    # @return  @products_hash
    def sort_products
        @products_hash = {}
        @products.each do |product|
            @categories.each do |category|
                if product.category_id == category.id
                    @products_hash[category.category_name] = Array.new if @products_hash[category.category_name].nil?
                    @products_hash[category.category_name]<< [product.product_name, product.id]
                end
            end
        end
    end
end
