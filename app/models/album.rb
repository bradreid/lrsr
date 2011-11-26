class Album < ActiveRecord::Base
    
  has_many :album_pictures

  validates_presence_of :title
end
