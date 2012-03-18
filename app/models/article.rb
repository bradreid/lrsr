class Article < ActiveRecord::Base
    
  belongs_to :created_by, :foreign_key => "created_by_id", :class_name => "User"
  
  validates_presence_of :title, :body
  before_create :set_current_user
  
  has_attached_file :image, :styles => { :medium => "300x300>"},:storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"  
  
  named_scope :front_page, :conditions => {:front_page => true}, :order => 'id desc'
  
  def tweet
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = "http://www.lrsr.ca/" 
      short = b.shorten(url)
      "#{self.title[0..125]} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end
  
private
 
  def set_current_user
    self.created_by = self.current_user
  end
end
