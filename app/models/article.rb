class Article < ActiveRecord::Base
    
  belongs_to :created_by, :foreign_key => "created_by_id", :class_name => "User"
  
  validates_presence_of :title, :body
  before_create :set_current_user
  
  has_attached_file :image, :styles => { :medium => "300x300>"},:storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"  
  
  named_scope :front_page, :conditions => {:front_page => true}, :order => 'id desc'
  
  def first_paragraph
    self.body.split(/\n/).first if self.body
  end
  
private
 
  def set_current_user
    self.created_by = self.current_user
  end
end
