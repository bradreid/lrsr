class NewslettersController < ApplicationController
  
  def index
    @newsletters = Newsletter.order('id desc').page params[:page]
  end
end