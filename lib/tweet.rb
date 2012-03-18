class Tweet
  
  
  DOMAIN_NAME = 'http://search.twitter.com/'
  SEARCH_PATH = "search.atom?q="
  
  attr_accessor :html
  
  
  def initialize(username)
    @username = username
  end

  def tweet(message)
    begin
      client.update(message)    
    # rescue  
    end
  end
  
  def name
    client.user(@username).name
  end
  
  def user
    client.user(@username)
  end
  
  def messages
    client.user_timeline
  end
  
  def destroy_messages
    begin
      self.messages.each do |m|
        client.status_destroy(m[:id])
      end
    # rescue
    end
  end
  
  def client
    begin
      return @twitter_client if @twitter_client
      if @username == 'financialsymrd'
        Twitter.configure do |config|
          config.consumer_key = 'dqEuRccLp779mCUPZTxw'
          config.consumer_secret = 'rAWoMV9BbikZJBBVyoLbTc76blWuhnsAgn3hon7r1Wo'
          config.oauth_token = '151142633-958RCPhh8jXfV895m4iFfP3W7wbNbd0twTbdtw4a'
          config.oauth_token_secret = '9TJHxUuwpWBFyKsSdpnsBc40GxhLEgC7aC0oT3w34c'
        end      
      elsif @username == 'symingtonroad'
        Twitter.configure do |config|
          config.consumer_key = 'PzqP0oNet73eyK1897rw'
          config.consumer_secret = 'hKMtQmgVMOz16NgJFFlxAretrVx9HSEiUCRQEoc'
          config.oauth_token = '146119625-B7h9drozYL6n5vNiXmpU5ZtfG57bKDDLlBgMZiEB'
          config.oauth_token_secret = 'YQKx3X1vB4BIFDokwZXSHdH2DZI83pFrOPpDwVV2bls'
        end
      elsif @username == 'doittooit'  
        Twitter.configure do |config|
          config.consumer_key = 'M7ZOTR6G37OJlv3SHQ'
          config.consumer_secret = '5Y4Dvwsq6eDhnVAMK0wwFshthhqZQF49AXFt1pI8g'
          config.oauth_token = '333702115-blKib5HT3hC2ZUqfu632k5bg9hHrnA8YTQjyfDdJ'
          config.oauth_token_secret = 'uWU05JGqZ1BzdOSjoYZB8F45I2YvpdwesbeM9CgPR8'
        end              
      elsif @username == 'discountbooks2'
        Twitter.configure do |config|
          config.consumer_key = 'Xwh0W5If2n8WtvRrTJW2gw'
          config.consumer_secret = 'EV0kd91rSoaxvNoWNPFR1fYIXtjWQiGAhC7B5R8E'
          config.oauth_token = '334339929-upCHETgfvtQVfBvbDcWsmwJwBfycFKhCrtCBfCjR'
          config.oauth_token_secret = 'c8KOrHpkEUz1tmDfN0xSD3FjBntCFh7DFOvOLctkcMs'
        end        
      end
      @twitter_client ||= Twitter::Client.new    
    # rescue
    end
  end
end