class FeriaController < ApplicationController
  before_action :set_ferium, only: [:show, :edit, :update, :destroy]

  # GET /feria
  # GET /feria.json
  def index
    @feria = Ferium.all
  end

  # GET /feria/1
  # GET /feria/1.json
  def show
  end

  # GET /feria/new
  def new
    @ferium = Ferium.new
  end

  # GET /feria/1/edit
  def edit
  end

  # POST /feria
  # POST /feria.json
  def create
    @ferium = Ferium.new(ferium_params)

    respond_to do |format|
      if @ferium.save
        format.html { redirect_to @ferium, notice: 'Ferium was successfully created.' }
        format.json { render :show, status: :created, location: @ferium }
      else
        format.html { render :new }
        format.json { render json: @ferium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feria/1
  # PATCH/PUT /feria/1.json
  def update
    respond_to do |format|
      if @ferium.update(ferium_params)
        format.html { redirect_to @ferium, notice: 'Ferium was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferium }
      else
        format.html { render :edit }
        format.json { render json: @ferium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feria/1
  # DELETE /feria/1.json
  def destroy
    @ferium.destroy
    respond_to do |format|
      format.html { redirect_to feria_url, notice: 'Ferium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferium
      @ferium = Ferium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferium_params
      params.require(:ferium).permit(:funcionario_id, :data_inicio, :data_fim)
    end
end
