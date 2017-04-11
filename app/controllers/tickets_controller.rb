class TicketsController < ApplicationController
  # def index; end # for current_user

  def new
    @ticket = Ticket.new
    set_ticket_context(params)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      set_ticket_context(ticket_params)
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @train  = @ticket.train.select(:number)
    @departure = @ticket.departure.select(:title)
    @arrival   = @ticket.arrival.select(:title)
  end

  private

  def set_ticket_context(params_)
    @train     = Train.find params_[:train_id]
    @departure = RailwayStation.find params_[:departure_id]
    @arrival   = RailwayStation.find params_[:arrival_id]
  end

  def ticket_params
    params.require(:ticket).permit(ticket_param_names)
  end

  def ticket_param_names
    %i(departure_id arrival_id user_id passenger_name passenger_document train_id)
  end
end
