class Api::MedicamentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_medicament, only: %i[ show edit update destroy ]

    # GET /medicaments or /medicaments.json
    def index
        @medicaments = Medicament.all

        render json: @medicaments
    end

    # GET /medicaments/1 or /medicaments/1.json
    def show
        render json: @medicament
    end

    # POST /medicaments or /medicaments.json
    def create
        @medicament = Medicament.new(medicament_params)

        if @medicament.save
            render json: @medicament
        else
            render json: @medicament.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /medicaments/1 or /medicaments/1.json
    def update
        if @medicament.update(medicament_params)
            render json: @medicament
        else
            render json: @medicament.errors, status: :unprocessable_entity
        end
    end

    # DELETE /medicaments/1 or /medicaments/1.json
    def destroy
        @medicament.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_medicament
            @medicament = Medicament.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def medicament_params
            params.require(:medicament).permit(:name, :description, :price, :category_id)
        end
end
