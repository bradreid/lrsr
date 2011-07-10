module TrailConditionHelper
  
  def trail_status(trail_condition)
    if trail_condition.status == 'closed'
      link_to 'Closed',  trail_condition_path(trail_condition), :class => 'red'
    elsif trail_condition.status == 'open'
      link_to 'Open',  trail_condition_path(trail_condition), :class => 'green'
    else
      link_to trail_condition.status.humanize, trail_condition_path(trail_condition)
    end
  end
end
