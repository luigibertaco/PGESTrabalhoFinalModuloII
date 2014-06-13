class BatidasController < ApplicationController
  before_action :set_batida, only: [:show, :edit, :update, :destroy]

  # GET /batidas
  # GET /batidas.json
  def index
    @batidas = Batida.all
  end

  # GET /batidas/1
  # GET /batidas/1.json
  def show
  end

  # GET /batidas/new
  def new
    @batida = Batida.new
  end

  # GET /batidas/1/edit
  def edit
  end

  # POST /batidas
  # POST /batidas.json
  def create
    @batida = Batida.new(batida_params)

    respond_to do |format|
      if @batida.save
        format.html { redirect_to @batida, notice: 'Batida was successfully created.' }
        format.json { render :show, status: :created, location: @batida }
      else
        format.html { render :new }
        format.json { render json: @batida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batidas/1
  # PATCH/PUT /batidas/1.json
  def update
    respond_to do |format|
      if @batida.update(batida_params)
        format.html { redirect_to @batida, notice: 'Batida was successfully updated.' }
        format.json { render :show, status: :ok, location: @batida }
      else
        format.html { render :edit }
        format.json { render json: @batida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batidas/1
  # DELETE /batidas/1.json
  def destroy
    @batida.destroy
    respond_to do |format|
      format.html { redirect_to batidas_url, notice: 'Batida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batida
      @batida = Batida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batida_params
      params.require(:batida).permit(:funcionario_id, :data, :hora)
    end
end
