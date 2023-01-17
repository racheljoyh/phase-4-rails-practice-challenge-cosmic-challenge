class ScientistsController < ApplicationController
  
  before_action :set_scientist, only: [ :show, :update, :destroy ]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET /scientists
  def index
    @scientists = Scientist.all

    render json: @scientists
  end

  # GET /scientists/1
  def show
    render json: @scientist, serializer: ScientistPlanetSerializer
  end

  # POST /scientists
  def create
    @scientist = Scientist.create!(scientist_params)

  
    render json: @scientist, status: :created
   
  end

  # PATCH/PUT /scientists/1
  def update
      @scientist.update!(scientist_params)
      render json: @scientist, status: :accepted
  end

  # DELETE /scientists/1
  def destroy
    @scientist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientist
      @scientist = Scientist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scientist_params
      params.permit(:name, :field_of_study, :avatar)
    end

    def render_unprocessable_entity
      render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

     def render_not_found
      render json: {error: "Scientist not found"}, status: :not_found
    end 
end
