class AlbumsController < AdminController
  
  def index
    @albums = Album.order('id desc').page params[:page]
  end
  
  def show
    @album = Album.find(params[:id])
  end
  
end