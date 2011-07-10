module ApplicationHelper
  
  def flashes
    render :partial => 'shared/flashes'
  end
  
  def nav_bar(controller)
    if controller.is_a? AdminController
      partial = 'shared/nav/admin'
    else
      partial = 'shared/nav/main'
    end
    render :partial => partial
  end
  
  def status_image(status)
    image = "icons/cross.png"
    if status.is_a? TrueClass
      image = "icons/tick.png" if status
    else
      case status
      when String
        image = "icons/tick.png" if status.downcase == 'active'
      else
        image = "icons/tick.png" if status
      end
    end
    image_tag image
  end
end
