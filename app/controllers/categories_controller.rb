class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all.by_name
  end

  def create
    @categories = Category.all.by_name
    @category = Category.new(category_params)
      if category.save
        flash[:success] = "New category created!"
        redirect_to @category
      end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all.by_name
  end
    def index
        @categories = Category.all
        @products = Product.all
        sort_products
        @products_hash
    end

    def show
        @category = Category.find(params[:id])
        @products = Product.all
    end
    
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

  private

  def category_params
    params.require(:category).permit(:category_name)
  end
end
