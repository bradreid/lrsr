class Newsletter < ActiveRecord::Base
  has_attached_file :newsletter, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  validates_attachment_presence :newsletter  
  validates_presence_of :name
  
  def tweet
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = self.newsletter.url 
      short = b.shorten(url)
      "Newsletter: #{self.name[0..125]} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end  
end
