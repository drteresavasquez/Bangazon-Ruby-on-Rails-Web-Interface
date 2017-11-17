class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = 'Image was uploaded successfully'
      redirect to @image
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:picture)
  end

end
