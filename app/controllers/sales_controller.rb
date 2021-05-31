class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    if session[:user_authority] == "ADMIN"
      @sales = Sale.order('id DESC').page params[:page]
    else
      @sales = Sale.where("user_id = #{session[:user_id]}").order('id DESC').page params[:page]
    end
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @medicaments = Medicament.all
  end

  # GET /sales/1/edit
  def edit
    @medicaments = Medicament.all
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new

    @sale.user_id = session[:user_id]
    @sale.user = session[:user_name]
    @sale.date_sale = DateTime.current.to_date

    price = 0

    sale_params[:medicaments].each do |medicament|
      medicament = Medicament.find(medicament)
      price += medicament.price
    end

    sale_params[:medicaments].each do |medicament|
      @sale.saleDetails.build(:price => price, :medicament_id => medicament)
    end

    respond_to do |format|
      if @sale.save
        p @sale
        format.html { redirect_to @sale, notice: "Compra realizada com sucesso." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "Compra atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Compra removida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:medicaments => [])
    end
end
