class SearchTrain
  def initialize(departure, arrival)
    @departure = departure
    @arrival   = arrival

    raise if [departure, arrival].compact.size < 2
  end

  def find
    routes_by_stations(departure, arrival).select do |route|
      depart = link_for_station(route, departure)
      arriv  = link_for_station(route, arrival)
      check(depart, arriv)
    end
  end

  private

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

  attr_accessor :departure, :arrival
end
