class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i(show destroy)

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
    ticket_context(params)
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: t('.success')
    else
      ticket_context(ticket_params)
      render :new
    end
  end

  def show
    @train     = @ticket.train
    @departure = @ticket.departure
    @arrival   = @ticket.arrival
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: t('.success')
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
    check_ticket_owner
  end

  def check_ticket_owner
    return true if current_user.id == @ticket.user_id || current_user.admin?
    redirect_to tickets_url, alert: 'Can\'t access this ticket'
  end

  def ticket_context(params_)
    @train     = Train.find params_[:train_id]
    @departure = RailwayStation.find params_[:departure_id]
    @arrival   = RailwayStation.find params_[:arrival_id]
  end

  def ticket_params
    params.require(:ticket).permit(ticket_param_names)
  end

  def ticket_param_names
    %i(departure_id arrival_id passenger_name passenger_document train_id)
  end
end
