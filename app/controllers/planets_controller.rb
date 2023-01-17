class PlanetsController < ApplicationController


  # GET /planets
  def index
    @planets = Planet.all

    render json: @planets
  end

end
