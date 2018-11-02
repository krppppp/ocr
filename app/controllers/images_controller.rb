class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def create
    image = image_params[:image]
    image_params = {}
    if image != nil
      image_params[:image] = image.read
    end
    system("ruby #{Rails.root}/app/helpers/ocr.rb #{image}")
    @image = Image.new(image_params)
    @image.save
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
    send_data @image.image, :type => 'image/jpeg', :disposition => 'inline'
  end


  def update

  end

  private

  def image_params
    params.require(:image).permit(:filename, :memo, :image, :string)
  end
end