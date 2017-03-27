class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage, notice: :success
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      render :show, notice: :success
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.delete
    redirect_back fallback_location: @train
  end

  private
    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:number, :carriage_type, :train_id, :bottom_seats, :top_seats)
    end
end
