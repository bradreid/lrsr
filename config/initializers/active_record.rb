# ======================================
# = Extensions to ActiveRecord::Errors =
# ======================================


class ActiveRecord::Base
  def current_user
    Thread.current["current_thread_user"] || User.system_user
  end
    
  class << self
    def current_user
      Thread.current["current_thread_user"] || User.system_user
    end
  end
end
