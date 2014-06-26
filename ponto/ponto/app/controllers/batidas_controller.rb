class BatidasController < ApplicationController
  before_action :set_batida, only: [:show, :edit, :update, :destroy]
  helper DiaHelper

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
    @batida.funcionario_id = params[:funcionario]
    @batida.data = params[:data]
  end

  # GET /batidas/1/edit
  def edit
  end

  # POST /batidas
  # POST /batidas.json
  def create
    @batida = Batida.new(batida_params)
    if @batida.save
      @data = @batida.data
      @funcionario = @batida.funcionario
      @batidas = Batida.where(data: @data, funcionario: @funcionario).order('time(hora)')
      render 'inconsistencias/show', notice: 'Batida criada com sucesso' 
    else
      render :new 
    end
  end

  # PATCH/PUT /batidas/1
  # PATCH/PUT /batidas/1.json
  def update
    
      if @batida.update(batida_params)
        @data = @batida.data
        @funcionario = @batida.funcionario
        @batidas = Batida.where(data: @data, funcionario: @funcionario).order('time(hora)')
        render 'inconsistencias/show', notice: 'Batida alterada com sucesso'
      else
        render :edit 
      end
    
  end

  # DELETE /batidas/1
  # DELETE /batidas/1.json
  def destroy
      @batida.destroy
      @data = @batida.data
      @funcionario = @batida.funcionario
      @batidas = Batida.where(data: @data, funcionario: @funcionario).order('time(hora)')
      render 'inconsistencias/show', notice: 'Batida excluida com sucesso' 
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