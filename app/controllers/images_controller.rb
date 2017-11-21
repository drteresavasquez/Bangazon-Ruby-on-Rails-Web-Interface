class ImagesController < ApplicationController

  # @build  finds one image from the db
  # @params  the id of the image to find
  # @return  @image
  def show
    @image = Image.find(params[:id])
  end

  # @build  instantiates image object
  # @params  none
  # @return  @image
  def new
    @image = Image.new
  end

  # @build  creates a new image
  # @params  bits from uploaded image file
  # @return  redirects to image_url
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

  # @build  allows picture to be editable by user
  # @params  none
  # @return  params
  def image_params
    params.require(:image).permit(:picture)
  end

end
