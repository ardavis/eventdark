class LocationsController < ApplicationController

  before_action :get_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
    @events = @location.events
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :description)
  end

  def get_location
    @location = Location.find(params[:id])
  end
end