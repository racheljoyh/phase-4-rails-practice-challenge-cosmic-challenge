class MissionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity 

  # POST /missions
  def create
    @mission = Mission.create!(mission_params)

    render json: @mission.planet, status: :created
    
  end



  private

    # Only allow a list of trusted parameters through.
    def mission_params
      params.permit(:name, :scientist_id, :planet_id)
    end

    def render_unprocessable_entity
      render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end


end
