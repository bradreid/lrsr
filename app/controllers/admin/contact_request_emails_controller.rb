class Admin::ContactRequestEmailsController < AdminController
  
  
  def new
    @contact_request_email = ContactRequestEmail.new
  end
  
  def edit
    @contact_request_email = ContactRequestEmail.find(params[:id])
  end
  
  def create
    @contact_request_email = ContactRequestEmail.new(params[:contact_request_email])
    if @contact_request_email.save
      flash[:notice] = "You successfully create a new email to send contact requests to"
      redirect_to admin_contact_requests_path
    else
      render 'new'
    end
  end
  
  def update
    @contact_request_email = ContactRequestEmail.find(params[:id])
    if @contact_request_email.update_attributes(params[:contact_request_email])
      flash[:notice] = "You successfully updated the contact request email"
      redirect_to admin_contact_requests_path          
    else
      render 'edit'
    end  
  end
  
  def destroy
    @contact_request_email = ContactRequestEmail.find(params[:id])
    if @contact_request_email.destroy
      flash[:notice] = "You successfully removed the contact request email"
    else
      flash[:error] = "The contact request email could not be removed, please try again."
    end
    redirect_to admin_contact_requests_path    
  end
end