class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
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
                                  :active)

  end
end

