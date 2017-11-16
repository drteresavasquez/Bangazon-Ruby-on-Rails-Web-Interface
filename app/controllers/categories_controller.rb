class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @products = Product.all
    end

    def sort_products
        
    end
end
