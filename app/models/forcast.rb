class Forcast < ActiveRecord::Base
  
  def forcast
    @weather ||= Weatherman::Response.new(self.raw_xml)
  end
  
  def valid?
    begin
      self.forcast.condition['temp']
      true
    rescue
      false
    end
  end
  
  def winnipeg_forcast
    @winnipeg ||= Weatherman::Response.new(self.winnipeg)    
  end
  
  def sky_conditions
    if self.forcast.condition['code'] == 3200
      self.winnipeg_forcast.condition['text']      
    else
      self.forcast.condition['text']
    end    
  end
  
  def sky_conditions_link
    if self.forcast.condition['code'] == 3200
      "http://s.imwx.com/v.20100719.135915/img/wxicon/130/#{self.winnipeg_forcast.condition['code']}.png"
      # self.winnipeg_forcast.description_image.attributes['src'].value      
    else
      "http://s.imwx.com/v.20100719.135915/img/wxicon/130/#{self.forcast.condition['code']}.png"
      # self.forcast.description_image.attributes['src'].value
    end
  end
  
  def self.latest
    last = Forcast.last
    if last && (last.created_at.utc > 30.minutes.ago.utc)
      last
    else
      begin
        client = Weatherman::Client.new
        winnipeg_url = client.send(:request_url, 2972)
        winnipeg_xml = client.send(:get, winnipeg_url)
        url = client.send(:request_url, 2590)
        xml = client.send(:get, url)
        n = Forcast.create!(:raw_xml => xml, :winnipeg => winnipeg_xml)
        self.connection.execute("delete from forcasts where id <> #{n.id}")
        n
      rescue
        last
      end
    end
  end
end
