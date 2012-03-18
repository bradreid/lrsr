class TwitterFeed < ActiveRecord::Base
  
  def self.create_feed
    self.create(:text => Tweet.new('lrsrclub').everything.map(&:attrs).to_json)
  end
  
  def self.next_tweet
    events_today = Event.all(:conditions => ["shared_before is NULL and start <= ? AND start >= ?", Time.now + 5.hours, Time.now.beginning_of_day])
    events_today.first.update_attribute(:shared_before, Time.now) if events_today.any?
    new_articles = Article.all(:conditions => {:shared => nil}, :order => 'id asc')
    new_events = Event.all(:conditions => {:shared => nil}, :order => 'id asc')
    new_trail_conditions = TrailCondition.all(:conditions => {:shared => nil}, :order => 'id asc')        
    tweets = events_today + new_trail_conditions + new_articles + new_events
    tweets.first
  end  
  
  def self.send_next_tweet
    next_tweet = TwitterFeed.next_tweet
    return unless next_tweet
    next_tweet.update_attribute(:shared,Time.now)
    Tweet.new('lrsrclub').tweet(next_tweet.tweet)
  end
  
  def self.new_if_needed
    last = TwitterFeed.last
    if last && (last.created_at.utc > 30.minutes.ago.utc)
      last
    else
      self.create_feed
    end    
  end
end