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
end


private

def category_params
  params.require(:category).permit(:category_name)
end