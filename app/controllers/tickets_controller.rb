class TicketsController < ApplicationController
  # def index; end

  def new
    @ticket = Ticket.new
    @trains = Train.all
    @train_id = params[:id]
  end

  def create
  end

  def show
  end
end
