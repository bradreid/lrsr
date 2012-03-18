class TrailCondition < ActiveRecord::Base
  
  belongs_to :updated_by, :foreign_key => "updated_by_id", :class_name => "User"
  
  validates_presence_of :trail_name, :status, :details, :updated_by
  
  before_create :set_current_user
  
  after_save :clear_shared_flag
  
  STATUSES = ['closed', 'open', 'use with caution']
  
  def self.club_trails
    TrailCondition.first
  end
  
  def tweet
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = "http://www.lrsr.ca/trail_conditions/1" 
      short = b.shorten(url)
      "Trail Status: #{self.status} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end  

private

  def set_current_user
    self.updated_by = self.current_user
  end
  
  def clear_shared_flag
    self.update_attribute(:shared, nil)
  end
end
