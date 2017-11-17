class ProductsController < ApplicationController

    def show
        @product = Product.find(params[:id])
        @seller = User.find(@product.seller_id)
    end

end
