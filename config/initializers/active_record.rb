# ======================================
# = Extensions to ActiveRecord::Errors =
# ======================================


class ActiveRecord::Base
  def current_user
    Thread.current["current_thread_user"] || User.system_user
  end
  
  def update_attribute_without_timestamps(attribute, value)
    self.record_timestamps = false 
    begin
      self.update_attribute(attribute,value)
    ensure
       self.record_timestamps = true 
    end
  end  
    
  class << self
    def current_user
      Thread.current["current_thread_user"] || User.system_user
    end
  end
end
