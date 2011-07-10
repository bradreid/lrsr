class DateTime
  alias_method :old_to_s, :to_s
  def to_s(args=nil)
    return old_to_s(args) if args
    self.strftime("%A, %B %d, %Y at %l:%M%p")
  end
end

class ActiveSupport::TimeWithZone
  alias_method :old_to_s, :to_s  
  def to_s(args=nil)
    return old_to_s(args) if args
    self.strftime("%A, %B %d, %Y at %l:%M%p")     
  end
end

class Time
  alias_method :old_to_s, :to_s
  def to_s(args=nil)
    if args
      old_to_s(args)
    else
      self.strftime("%A, %B %d, %Y at %l:%M%p")      
    end
  end  
end