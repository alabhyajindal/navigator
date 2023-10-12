class LocationsController < ApplicationController
  before_action :require_signin

  def index
    @locations = current_user.locations
  end

  def manage
    @location = current_user.locations.new
    @locations = current_user.locations
  end

  def navigator
  end

  def create
    if current_user.locations.create(location_params)
      redirect_to new_location_path, notice: 'Location added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    location = Location.find(params[:id])
    if location.update(location_params)
      redirect_to new_location_path, notice: 'Location updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    redirect_to new_location_path, alert: 'Location deleted'
  end

  private

  def location_params
    params.require(:location).permit(:city, :notes)
  end
end
