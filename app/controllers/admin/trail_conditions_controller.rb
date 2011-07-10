class Admin::TrailConditionsController < AdminController

  
  def show
    @trail_condition = TrailCondition.first
  end
  
  def edit
    @trail_condition = TrailCondition.first
  end
  
  def update
    @trail_condition = TrailCondition.first
    if @trail_condition.update_attributes(params[:trail_condition])
      flash[:notice] = "You successfully updated the trail conditions"
      redirect_to admin_index_path
    else
      render 'edit'
    end
  end
end