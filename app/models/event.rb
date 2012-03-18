class Event < ActiveRecord::Base
  validates_presence_of :name, :start, :location
  
    named_scope :upcomming, :conditions => ["start >= ?", Time.now.utc.to_s(:db)], :order => 'start asc'
  
  def display_time
    self.start
  end
  
  def tweet
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = "http://www.lrsr.ca/events/#{self.id}" 
      short = b.shorten(url)
      "#{self.name[0..125]} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end  
end
