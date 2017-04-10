module TrainsHelper
  def stations_params
    return {} unless params[:railway_station]
    params.require(:railway_station).permit(%i(departure_id arrival_id))
  end
end
