class LocationsController < ApplicationController
  before_action :require_signin, except: [:index]

  def index
    @locations = current_user.locations if current_user
  end

  def manage
    @location = current_user.locations.new
    @locations = current_user.locations
  end

  def create
    if current_user.locations.create(location_params).valid?
      msg = { status: 'success' }
    else
      msg = { status: 'fail' }
    end
    render :json => msg
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    redirect_to manage_url, alert: 'Location deleted.'
  end

  def api_locations
    locations = current_user.locations
    data = locations.map do |l|
      l.coordinates
    end
    msg = { :data => data, status: 'success' }
    render :json => msg
  end

  private

  def location_params
    params.require(:data).permit(:city, :coordinates => [])
  end
end
