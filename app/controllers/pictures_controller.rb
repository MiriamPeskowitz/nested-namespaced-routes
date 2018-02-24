class PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
  end  

  def edit
    @picture = Picture.find(params[:id])
  end
  
  def create
    @album = Album.find(params[:album_id])
    @picture =  @album.pictures.build(picture_params)

    @picture.save
                              
    redirect_to album_picture_url(@picture.album, @picture)
  end

# was def create
  # @picture = Picture.new(picture_params)
  # @picture.save
  # redirect_to picture_url(@picture) -- use url helper here. 
  

  private
    def picture_params
      params.require(:picture).permit(:url, :album_id) # add album_id? 
    end
end
