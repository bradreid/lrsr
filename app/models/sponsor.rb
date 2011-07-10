class Sponsor < ActiveRecord::Base
  validates_presence_of :name
  
  
  def self.random
    Sponsor.find_by_sql("SELECT * FROM sponsors ORDER BY RANDOM() LIMIT 1")
  end
end
