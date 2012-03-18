class TwitterFeed < ActiveRecord::Base
  
  def self.create_feed
    self.create(:text => Tweet.new('lrsrclub').everything.map(&:attrs).to_json)
  end
  
  def self.next_tweet
    events_today = Event.all(:conditions => ["shared_before is NULL and start <= ? AND start >= ?", Time.now + 5.hours, Time.now.beginning_of_day])
    events_today.first.update_attribute_without_timestamps(:shared_before, Time.now) if events_today.any?
    new_articles = Article.all(:conditions => {:shared => nil}, :order => 'id asc')
    new_events = Event.all(:conditions => {:shared => nil}, :order => 'id asc')
    new_trail_conditions = TrailCondition.all(:conditions => {:shared => nil}, :order => 'id asc')        
    tweets = events_today + new_trail_conditions + new_articles + new_events
    tweets.first
  end  
  
  def self.send_next_tweet
    nt = self.next_tweet
    return unless nt
    nt.update_attribute(:shared,Time.now)
    Tweet.new('lrsrclub').tweet(nt.tweet)
  end
  
  def self.new_if_needed
    last = TwitterFeed.last
    if last && (last.created_at.utc > 30.minutes.ago.utc)
      last
    else
      self.send_next_tweet
      self.create_feed
    end    
  end
end