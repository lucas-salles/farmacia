class Api::CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_category, only: %i[ show edit update destroy ]

    # GET /categories or /categories.json
    def index
        @categories = Category.all

        render json: @categories
    end

    # GET /categories/1 or /categories/1.json
    def show
        render json: @category
    end

    # POST /categories or /categories.json
    def create
        @category = Category.new(category_params)

        if @category.save
            render json: @category
        else
            render json: @category.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /categories/1 or /categories/1.json
    def update
        if @category.update(category_params)
            render json: @category
        else
            render json: @category.errors, status: :unprocessable_entity
        end
    end

    # DELETE /categories/1 or /categories/1.json
    def destroy
        @category.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
            @category = Category.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def category_params
            params.require(:category).permit(:name)
        end
end
