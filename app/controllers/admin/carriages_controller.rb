class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: %i[show edit update destroy]
  def index
    @train_id  = train_id
    @carriages = train_id ? Carriage.where(train_id: train_id) : Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
    @train = train
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to edit_admin_carriage_path(@carriage), notice: :success
    else
      render :new
    end
  end

  def edit; end

  def update
    if @carriage.update(carriage_params)
      render :show, notice: :success
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.destroy
    redirect_back fallback_location: [:admin, train]
  end

  private

  def train_id
    params[:train_id]
  end

  def train
    return unless train_id
    @train = Train.find(train_id)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(
      :number, :serial, :type, :train_id,
      :bottom_places, :top_places, :side_bottom_places, :side_top_places,
      :seat_places
    )
  end
end
