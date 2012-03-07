class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_objects

  def set_objects
    @sponsor = Sponsor.random.first    
    Thread.current["current_thread_user"] = @current_user    
  end 
end
