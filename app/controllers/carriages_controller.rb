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
    @carriage.destroy
    redirect_back fallback_location: train
  end

  private
    # два запроса - плохо... но как иначе обратиться к нужному классу, не захламляя роуты?
    # поменять класс - нельзя, создать с существующим id - разумеется тоже
    # остается либо два запроса, либо передача типа сразу в url
    def set_carriage
      klass = Carriage.find(params[:id]).type.constantize
      @carriage = klass.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:number, :type, :train_id,
        :bottom_places, :top_places, :side_bottom_places, :side_top_places)
    end
end
