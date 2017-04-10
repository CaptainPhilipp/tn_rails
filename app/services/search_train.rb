class SearchTrain
  def initialize(params)
    @params = params
  end

  def by_stations
    find_routes(params[:departure_id], params[:arrival_id]).map(&:trains).flatten
  end

  private

  attr_accessor :params

  def find_routes(departure_id, arrival_id)
    routes_by_stations(departure_id, arrival_id).select do |route|
      depart = link_for_station(route, departure_id)
      arriv  = link_for_station(route, arrival_id)
      check(depart, arriv)
    end
  end

  def check(depart, arriv)
    depart.any? && arriv.any? && depart.first.sort_key < arriv.first.sort_key
  end

  def routes_by_stations(*stations)
    Route
      .eager_load(:rel_railway_stations_routes)
      .where('rel_railway_stations_routes.railway_station_id IN (?)', stations)
  end

  def link_for_station(route, station_id)
    route.rel_railway_stations_routes.where railway_station_id: station_id
  end
end
