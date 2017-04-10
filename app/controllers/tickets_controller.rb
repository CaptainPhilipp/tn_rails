class TicketsController < ApplicationController
  # def index; end

  def new
    @ticket = Ticket.new
    @trains = Train.all
    @stations = RailwayStation.all
    @train_id = params[:id]
  end

  def create
  end

  def show
  end
end
