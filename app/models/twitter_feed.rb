class TwitterFeed < ActiveRecord::Base
  
  def self.create_feed
    self.create(:text => Tweet.new('lrsrclub').everything.map(&:attrs).to_json)
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