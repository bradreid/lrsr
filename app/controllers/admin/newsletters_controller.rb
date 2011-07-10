class Admin::NewslettersController < AdminController

  def index
    @newsletters = Newsletter.order('id desc').page params[:page]
  end
  
  def new
    @newsletter = Newsletter.new
  end
  
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      flash[:notice] = "You successfully created a newsletter"
      redirect_to admin_newsletters_path
    else
      render 'new'
    end
  end
  
  def edit
    @newsletter = Newsletter.find(params[:id])
  end
  
  def update
    @newsletter = Newsletter.find(params[:id])    
    if @newsletter.update_attributes(params[:newsletter])
      flash[:notice] = 'You successfully updated the newsletter'
      redirect_to admin_newsletters_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.destroy
      flash[:notice] = "You successfully deleted the newsletter"
    end
    redirect_to admin_newsletters_path    
  end
end