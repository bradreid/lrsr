class TrailCondition < ActiveRecord::Base
  
  belongs_to :updated_by, :foreign_key => "updated_by_id", :class_name => "User"
  
  validates_presence_of :trail_name, :status, :details, :updated_by
  
  before_create :set_current_user
  
  STATUSES = ['closed', 'open', 'use with caution']
  
  def self.club_trails
    TrailCondition.first
  end

private

  def set_current_user
    self.updated_by = self.current_user
  end
end
