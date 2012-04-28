class TwitterFeed < ActiveRecord::Base
  
  def self.create_feed
    n = nil
    begin
      n = self.create(:text => Tweet.new('lrsrclub').everything.map(&:attrs).to_json)
    rescue
    end
    self.connection.execute("delete from twitter_feeds where id <> #{n.id}") if n
    n
  end
  
  def self.next_tweet
    events_today = Event.all(:conditions => ["shared_before is NULL and start <= ? AND updated_at < ?", Time.now + 1.day, Time.now - 30.minutes])
    events_today.first.update_attribute(:shared_before, Time.now) if events_today.any?
    new_articles = Article.all(:conditions => ["shared is null and front_page = ? and updated_at < ?", true, Time.now - 30.minutes])
    new_events = Event.all(:conditions => ["shared is null and updated_at < ?", Time.now - 30.minutes], :order => 'id asc')
    new_newsletters = Newsletter.all(:conditions => ["shared is null and updated_at < ?", Time.now - 30.minutes])
    new_trail_conditions = TrailCondition.all(:conditions => ["shared is null and user_updated_at < ?", Time.now - 1.minutes], :order => 'id asc')
    tweets = events_today + new_trail_conditions + new_articles + new_events + new_newsletters
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