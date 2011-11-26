class Admin::AlbumsController < AdminController
  
  def index
    @albums = Album.order('id desc').page params[:page]
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.create(params[:album])
    if @album.save
      flash[:notice] = "You successfully created a new photo album."
      redirect_to admin_album_path(@album)
    else
      render 'new'
    end
  end
  
  def show
    @album = Album.find(params[:id])
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "You successfully updated the album"
      redirect_to admin_album_path(@album)
    else
      render 'edit'
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      flash[:notice] = "You successfully removed the photo album"
    else
      flash[:error] = "The photo album could not be removed, please try again."
    end
    redirect_to admin_albums_path    
  end
end