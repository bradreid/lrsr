class AlbumPicture < ActiveRecord::Base
    
  belongs_to :album
  
  has_attached_file :image, :styles => { :medium => "300x300>"},:storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"  
  
end
