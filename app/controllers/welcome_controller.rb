class WelcomeController < ApplicationController 
  
  def index
    @events = Event.upcomming
    @articles = Article.front_page
    @trail_condition = TrailCondition.club_trails
    @newsletter = Newsletter.last
    @weather = Forcast.latest
    @tweets = TwitterFeed.new_if_needed
  end
end
