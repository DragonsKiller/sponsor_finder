module Api::V1
  class IdeasController < ApplicationController
    before_action :set_idea, only: [:show, :update, :destroy]
    def index
      @ideas = Idea.all
      render json: @ideas
    end

    def show
      render json: @idea
    end

    def create
      @idea = Idea.new(idea_params)

      if @idea.save
        render json: @idea, status: :created
      else
        render json: @idea.errors, status: :unprocessable_entity
      end
    end

    def update
      if @idea.update(idea_params)
        render json: @idea
      else
        render json: @idea.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @idea.destroy
      if @idea.destroy
        head :no_content, status: :ok
      else
        render json: @idea.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :problem, :industry, :team, :geographical_focus, :requirements, :next_steps, :trader_id)
    end
  end
end
