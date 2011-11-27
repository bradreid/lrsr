class Admin::Albums::AlbumPicturesController < AdminController
  
  def create
    @album = Album.find(params[:album_id])
    @picture = @album.album_pictures.build(params[:album_picture])
    if @picture.save
      flash[:notice] = "You successfully added a new photo."
      redirect_to admin_album_path(@album)
    else
      render 'admin/albums/show'
    end
  end

  
  def destroy
    @album = Album.find(params[:album_id])
    @picture = @album.album_pictures.find(params[:id])
    if @picture.destroy
      flash[:notice] = "You successfully deleted a photo."
      redirect_to admin_album_path(@album)
    else
      render 'admin/albums/show'
    end  
  end
end