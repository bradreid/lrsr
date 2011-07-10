class Admin::ContactRequestsController < AdminController
  
  def index
    @contact_requests = ContactRequest.order('id desc').page params[:page]
  end
  
  def show
    @contact_request = ContactRequest.find(params[:id])
    @contact_request.update_attribute(:received, true)
    load_new_contact_requests    
  end
  
  def destroy
    @contact_request = ContactRequest.find(params[:id])
    if @contact_request.destroy
      flash[:notice] = "You successfully removed the contact request"
    else
      flash[:error] = "The contact_request could not be removed, please try again."
    end
    redirect_to admin_contact_requests_path    
  end
end