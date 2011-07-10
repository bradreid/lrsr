class Event < ActiveRecord::Base
  validates_presence_of :name, :start, :location
  
    named_scope :upcomming, :conditions => ["start >= ?", Time.now.utc.to_s(:db)], :order => 'start asc'
  
  def display_time
    self.start
  end
end
