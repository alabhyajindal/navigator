class LocationsController < ApplicationController
  before_action :require_signin

  def index
    @locations = current_user.locations
  end

  def new
    @location = current_user.locations.new
    @locations = current_user.locations
  end

  def create
    if current_user.locations.create(location_params)
      redirect_to new_location_path, notice: 'City added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:city)
  end
end
