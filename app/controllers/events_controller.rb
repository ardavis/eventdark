class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy, :attend]

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

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params)
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
    @user = User.where(name: params[:name]).first_or_create
    # @event.users << @user
    # Pledge.create(event_id: @event.id, user_id: @user.id, guest_count: params[:guest_count])
    @event.pledges.create(user_id: @user.id, guest_count: params[:guest_count].to_i + 1)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location_id)
  end

  def get_event
    @event = Event.find(params[:id])
  end
end