class Article < ActiveRecord::Base
  
  belongs_to :created_by, :foreign_key => "created_by_id", :class_name => "User"
  
  validates_presence_of :title, :body
  before_create :set_current_user
  
  
private
 
  def set_current_user
    self.created_by = self.current_user
  end
end
