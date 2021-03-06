class ImagesController < ApplicationController
  def new
  	@image = Image.new
    FileWorker.perform_async()
  end

  def create
    @image = Image.new(image_params)
    FileWorker.perform_async()
    if @image.save
      FileWorker.perform_async()
      flash[:notice] = "Image Created"

      redirect_to root_path

    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    FileWorker.perform_async()
    flash[notice] = "Image Removed"

    redirect_to images_path
  end

  def index
    @images = Image.all
    @categories = Category.all
  end

  private
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type,)
    end
end