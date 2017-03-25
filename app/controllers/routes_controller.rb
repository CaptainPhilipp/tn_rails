class RoutesController < ApplicationController
  before_action :find_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    render @route.save ? @route : :new
  end

  def edit
  end

  def update
    if @route.update(route_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @route.delete
    render :index
  end

  private

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end
