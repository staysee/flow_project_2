class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    # @events = Event.all
    @events = Event.paginate(page: params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = 'Thanks for sharing your event'
      redirect_to event_path(@event)
    else
      flash.now[:error] = 'Event could not save. Try again'
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event Updated"
      redirect_to event_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event has been deleted."
    redirect_to :back
  end


private

  def event_params
    params.require(:event).permit(:name, :event_type, :description, :street, :city, :state, :zip_code)
  end

  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    redirect_to root_path if @event.nil?
  end
end
