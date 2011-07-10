class Admin::SponsorsController < AdminController

  
  def index
    @sponsors = Sponsor.order('name asc')
  end
  
  def new
    @sponsor = Sponsor.new
  end
  
  def create
    @sponsor = Sponsor.new(params[:sponsor])
    if @sponsor.save
      flash[:notice] = "You successfully create a new sponsor."
      redirect_to admin_sponsors_path
    else
      render 'new'
    end
  end
  
  def edit
   @sponsor = Sponsor.find(params[:id])    
  end
  
  def update
    @sponsor = Sponsor.find(params[:id])    
    if @sponsor.update_attributes(params[:sponsor])
      flash[:notice] = "You successfully updated the sponsor"
      redirect_to admin_sponsors_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.destroy
      flash[:notice] = "You successfully deleted the sponsor"
    end
    redirect_to admin_sponsors_path    
  end
end