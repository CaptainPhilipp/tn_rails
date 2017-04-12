class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
    @stations = @route.railway_stations
    @trains = @route.trains
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route, notice: :success
    else
      render :new
    end
  end

  def edit; end

  def update
    if @route.update(route_params)
      render :show, notice: :success
    else
      render :edit
    end
  end

  def destroy
    @route.delete
    redirect_to routes_path, notice: :success
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(
      :title,
      railway_station_ids: [],
      rel_railway_stations_routes: [:id, :departure_time, :arrival_time]
    )
  end
end
