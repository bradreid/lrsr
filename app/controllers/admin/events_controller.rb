class Admin::EventsController < AdminController
  
  def index
    if params['upcomming_events'] == '1'
      @events = Event.order('start asc').where("start >= ?", Time.now.utc.to_s(:db)).page params[:page]      
    else
      @events = Event.order('start asc').page params[:page]
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create(params[:event])
    if @event.save
      flash[:notice] = "You successfully created a new event."
      redirect_to admin_events_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "You successfully updated the event"
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "You successfully removed the event"
    else
      flash[:error] = "The event could not be removed, please try again."
    end
    redirect_to admin_events_path    
  end
end