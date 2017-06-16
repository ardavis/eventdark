class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy, :attend, :decline]
  before_action :format_dates, only: [:create, :update]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    @event.started_at = @started_at
    @event.ended_at = @ended_at

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    @event.assign_attributes(event_params)

    @event.started_at = @started_at
    @event.ended_at = @ended_at

    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def attend
    # @event.users << current_user
    # Pledge.create(event_id: @event.id, user_id: @user.id, guest_count: params[:guest_count])
    @event.pledges.create(user: current_user, guest_count: params[:guest_count].to_i + 1)
    redirect_to @event
  end

  def decline
    @event.pledges.find_by(user: current_user).destroy
    redirect_to @event
  end

  private

  def format_dates
    @started_at = DateTime.strptime(event_params[:started_at], '%m/%d/%Y %H:%M %p')
    @ended_at = DateTime.strptime(event_params[:ended_at], '%m/%d/%Y %H:%M %p')
  end

  def event_params
    params.require(:event).permit(:name, :description, :location_id, :started_at, :ended_at)
  end

  def get_event
    @event = Event.find(params[:id])
  end
end