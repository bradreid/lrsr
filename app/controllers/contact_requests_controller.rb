class ContactRequestsController < ApplicationController 
  
  def new
    @contact_request = ContactRequest.new
  end
  
  def create
    @contact_request = ContactRequest.new(params[:contact_request])
    if @contact_request.save
      flash[:notice] = "You have successfully submitted a contact request."
      redirect_to root_path
    else
      render 'new'
    end
  end
end
