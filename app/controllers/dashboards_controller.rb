class DashboardsController < ApplicationController
  before_action :require_signin, only: [:show]
  def index
  end

  def show
  end

  def cities
  end
end
