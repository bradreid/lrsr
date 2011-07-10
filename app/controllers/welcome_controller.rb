class WelcomeController < ApplicationController 
  
  def index
    @events = Event.upcomming
    @article = Article.last
    @trail_condition = TrailCondition.club_trails
    @newsletter = Newsletter.last
    @weather = Forcast.latest
  end
end
