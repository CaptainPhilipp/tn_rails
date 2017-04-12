class SearchController < ApplicationController
  before_action :search_context, only: %i(new find)

  def new; end

  def find
    @trains = SearchTrain.new(stations_params).by_stations
    render :new
  end

  private

  def search_context
    @stations = RailwayStation.all
    @trains   = []
    @departure_id = stations_params[:departure_id]
    @arrival_id   = stations_params[:arrival_id]
  end

  def stations_params
    return {} unless params[:railway_station]
    params.require(:railway_station).permit %i(departure_id arrival_id)
  end
end
