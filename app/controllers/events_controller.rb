class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:sucess] = 'Thanks for sharing your event'
      redirect_to event_path
    else
      flash[:error] = 'Event could not save. Try again'
      redirect_to new_event_path
    end
  end


private

  def event_params
    params.require(:event).permit(:name, :event_type, :description, :street, :city, :state, :zip_code)
  end
end
