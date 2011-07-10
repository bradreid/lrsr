class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_objects

  def set_objects
    # @feature_sponsor = Sponsor.random.first unless self.is_a? WelcomeController # don't do it on front page
    @sponsor = Sponsor.random.first    
    Thread.current["current_thread_user"] = @current_user    
  end 
end
