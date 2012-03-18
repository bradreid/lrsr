class TwitterFeed < ActiveRecord::Base
  
  def self.create_feed
    self.create(:text => Tweet.new('lrsrclub').everything.map(&:attrs).to_json)
  end
end