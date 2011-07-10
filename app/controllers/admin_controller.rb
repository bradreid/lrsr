class AdminController < ApplicationController 
  before_filter :authenticate_user!, :load_new_contact_requests
  
private

  def load_new_contact_requests
    flash.now[:warn] = nil
    @new_contact_requests = ContactRequest.where({:received => false})
    if @new_contact_requests.size > 0
      flash.now[:warn] = "You have #{@new_contact_requests.size} unread contact requests".html_safe
    end
  end
end