class RoutesController < ApplicationController
  before_action :find_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.create(route_params)
    render @route
  end

  def show
  end

  def edit
  end

  def update
    @route.update(route_params)
    @route.reload
    render :edit
  end

  def destroy
    @route.delete
  end

  private

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end
