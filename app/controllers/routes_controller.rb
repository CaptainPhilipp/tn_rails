class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    # TODO
  end

  def show
    # TODO
  end

  def edit
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
