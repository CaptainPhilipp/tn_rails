# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed
  WAGON_TYPES = %w(CoupeCarriage FirstClassCarriage EconomyCarriage SeatCarriage)

  def stations(count)
    alphabet = (?A..?Z).to_a
    count.times { RailwayStation.create(title: "Station-#{alphabet.shift * 2}") }
  end

  def routes(stations, count)
    count.times do |i|
      conditions = [true, false]
      route = Route.create(title: i.to_s * 5)
      route.reload
      stations.each do |station|
        next if conditions.sample
        route.stations << station unless route.stations.include? station
        station.update_sort_key(route)
      end
    end
  end

  def trains(count, num_length = 4)
    count.times { Train.create(number: generate_num(num_length)) }
  end

  def trains_to_routes(trains, routes)
    trains = trains.to_a
    routes.each do |route|
      train = trains.shift
      route.trains << train if train
    end
    trains.each { |train| train.route = routes.sample; train.save }
  end

  def allocate_trains(trains)
    trains.each do |train|
      train.current_station = train.route.stations.sample
      train.save
    end
  end

  def wagons(trains, count, num_length = 4)
    trains.each do |train|
      rand(count).times do
        train.carriages.create(number: generate_num(num_length), type: rand_car_type)
      end
    end
  end

  def clear(*models)
    models.each { |model| model.all.each(&:destroy) }
  end

  private

  def rand_car_type
    WAGON_TYPES[rand WAGON_TYPES.size]
  end

  def generate_num(length)
    from = 10**(length - 1)
    upto = 10**length - from - 1
    from + rand(upto)
  end
end

seed = Seed.new

seed.clear(RailwayStation, Train, Carriage)

seed.stations 5
seed.routes RailwayStation.all, 20

seed.trains 25
seed.wagons(Train.all, 12)

seed.trains_to_routes(Train.all, Route.all)
seed.allocate_trains(Train.all)
