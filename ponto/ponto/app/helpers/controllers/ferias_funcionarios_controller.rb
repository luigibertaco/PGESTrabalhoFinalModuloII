class FeriasFuncionariosController < ApplicationController
  before_action :set_ferias_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /ferias_funcionarios
  # GET /ferias_funcionarios.json
  def index
    @ferias_funcionarios = FeriasFuncionario.all
  end

  # GET /ferias_funcionarios/1
  # GET /ferias_funcionarios/1.json
  def show
  end

  # GET /ferias_funcionarios/new
  def new
    @ferias_funcionario = FeriasFuncionario.new
  end

  # GET /ferias_funcionarios/1/edit
  def edit
  end

  # POST /ferias_funcionarios
  # POST /ferias_funcionarios.json
  def create
    @ferias_funcionario = FeriasFuncionario.new(ferias_funcionario_params)

    respond_to do |format|
      if @ferias_funcionario.save
        format.html { redirect_to @ferias_funcionario, notice: 'Ferias funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @ferias_funcionario }
      else
        format.html { render :new }
        format.json { render json: @ferias_funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ferias_funcionarios/1
  # PATCH/PUT /ferias_funcionarios/1.json
  def update
    respond_to do |format|
      if @ferias_funcionario.update(ferias_funcionario_params)
        format.html { redirect_to @ferias_funcionario, notice: 'Ferias funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferias_funcionario }
      else
        format.html { render :edit }
        format.json { render json: @ferias_funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferias_funcionarios/1
  # DELETE /ferias_funcionarios/1.json
  def destroy
    @ferias_funcionario.destroy
    respond_to do |format|
      format.html { redirect_to ferias_funcionarios_url, notice: 'Ferias funcionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferias_funcionario
      @ferias_funcionario = FeriasFuncionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferias_funcionario_params
      params.require(:ferias_funcionario).permit(:funcionario_id, :data_inicio, :data_fim)
    end
end
