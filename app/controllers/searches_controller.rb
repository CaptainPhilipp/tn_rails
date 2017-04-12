class SearchesController < ApplicationController
  def trains_by_terminal_stations
    @stations = RailwayStation.all
    @trains   = SearchTrain.new(stations_params).by_stations

    @departure_id = stations_params[:departure_id]
    @arrival_id   = stations_params[:arrival_id]
  end

  private

  def stations_params
    return {} unless params[:railway_station]
    params.require(:railway_station).permit %i(departure_id arrival_id)
  end
end
