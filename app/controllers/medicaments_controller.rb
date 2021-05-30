class MedicamentsController < ApplicationController
  before_action :set_medicament, only: %i[ show edit update destroy ]

  # GET /medicaments or /medicaments.json
  def index
    @medicaments = Medicament.order('id DESC').page params[:page]
  end

  # GET /medicaments/1 or /medicaments/1.json
  def show
  end

  # GET /medicaments/new
  def new
    @medicament = Medicament.new
    @categories = Category.all
  end

  # GET /medicaments/1/edit
  def edit
    @categories = Category.all
  end

  # POST /medicaments or /medicaments.json
  def create
    @medicament = Medicament.new(medicament_params)

    respond_to do |format|
      if @medicament.save
        format.html { redirect_to @medicament, notice: "Medicamento cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @medicament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicaments/1 or /medicaments/1.json
  def update
    respond_to do |format|
      if @medicament.update(medicament_params)
        format.html { redirect_to @medicament, notice: "Medicamento atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @medicament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicaments/1 or /medicaments/1.json
  def destroy
    @medicament.destroy
    respond_to do |format|
      format.html { redirect_to medicaments_url, notice: "Medicamento removido com sucesso." }
      format.json { head :no_content }
    end
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
