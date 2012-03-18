# ======================================
# = Extensions to ActiveRecord::Errors =
# ======================================


class ActiveRecord::Base
  def current_user
    Thread.current["current_thread_user"] || User.system_user
  end
  
  def without_timestamps(*models, &block)
    models.each{|m| m.record_timestamps = false }
    begin
      yield
    ensure
      models.each{|m| m.record_timestamps = true }
    end
  end  
    
  class << self
    def current_user
      Thread.current["current_thread_user"] || User.system_user
    end
    
    def without_timestamps(*models, &block)
      models.each{|m| m.record_timestamps = false }
      begin
        yield
      ensure
        models.each{|m| m.record_timestamps = true }
      end
    end    
  end
end
