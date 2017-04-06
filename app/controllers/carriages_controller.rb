class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to edit_carriage_path(@carriage), notice: :success
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
    redirect_back fallback_location: train
  end

  private

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
