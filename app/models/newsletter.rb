class Newsletter < ActiveRecord::Base
  has_attached_file :newsletter, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  validates_attachment_presence :newsletter  
  validates_presence_of :name
end
