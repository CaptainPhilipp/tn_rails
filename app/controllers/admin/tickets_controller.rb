class Admin::TicketsController < Admin::Base
  before_action :set_admin_ticket, only: %i[show edit update destroy]
  before_action :any_ticket_context
  before_action :concrete_ticket_context, only: %i[show edit new]

  # GET /admin/tickets
  # GET /admin/tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /admin/tickets/1
  # GET /admin/tickets/1.json
  def show; end

  # GET /admin/tickets/new
  def new; end

  # GET /admin/tickets/1/edit
  def edit; end

  # POST /admin/tickets
  # POST /admin/tickets.json
  def create
    @ticket = Ticket.new(admin_ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tickets/1
  # PATCH/PUT /admin/tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(admin_ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tickets/1
  # DELETE /admin/tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def any_ticket_context
    @users     = User.all
    @trains    = Train.all
    @stations  = RailwayStation.all
  end

  def concrete_ticket_context
    @ticket  ||= Ticket.new
    required   = params[:ticket] ? params.require(:ticket) : {}
    @train     = @ticket.train || required[:train_id] && Train.find(required[:train_id])
    @departure = @ticket.departure || required[:departure_id] && RailwayStation.find(required[:departure_id])
    @arrival   = @ticket.arrival || required[:arrival_id] && RailwayStation.find(required[:arrival_id])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_admin_ticket
    @ticket = Ticket.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def admin_ticket_params
    params.require(:ticket).permit(ticket_param_names)
  end

  def ticket_param_names
    %i(departure_id arrival_id passenger_name passenger_document train_id user_id)
  end
end
