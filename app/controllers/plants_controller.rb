class PlantsController < ApplicationController

    def create
        plant = Plant.create(params.permit(:name, :image, :price))
        render json: plant, status: :created
    end

    def index
        plants = Plant.all

        if plants
            render json: plants, status: :ok
        else  
            plant_error
        end
    end

    def show
        plant = Plant.find_by(id: params[:id])
        
        if plant
            render json: plant, status: :ok
        else  
            plant_error
        end
    end

    private

    def plant_error
        render json: {error: "No plant found"}, status: :not_found
    end
end
