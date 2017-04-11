class TrainsController < ApplicationController
  include TrainsHelper
  before_action :set_train, only: %i(show edit update destroy)

  # GET /trains
  # GET /trains.json
  def index
    @trains = Train.all
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
    @route  = @train.route
    @routes = Route.all
  end

  # POST /trains
  # POST /trains.json
  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to @train, notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trains/1
  # PATCH/PUT /trains/1.json
  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  def search
    @stations = RailwayStation.all
    @trains   = SearchTrain.new(stations_params).by_stations

    @departure_id = stations_params[:departure_id]
    @arrival_id   = stations_params[:arrival_id]
  end

  private
    def set_train
      @train_mfker = Shit.find(params[:id])
    end

    def train_params
      params.require(:train).permit(
        :number, :current_station_id, :route_id, carriage_ids: []
      )
    end

    def stations_params
      return {} unless params[:railway_station]
      params.require(:railway_station).permit %i(departure_id arrival_id)
    end
end
