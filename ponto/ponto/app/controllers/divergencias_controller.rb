class DivergenciasController < ApplicationController
  before_action :set_divergencia, only: [:show, :edit, :update, :destroy]
  helper DiaHelper
  
  def index
    @divergencias ||= []
    data_inicial = Batida.order(:data).all.any? ? Batida.order(:data).all.first.data : Date.today
    if current_user.administrador?
      funcionarios = Funcionario.all 
    else
      funcionarios = Funcionario.where(setor: current_user.setor)
    end
    (data_inicial..Date.yesterday).map do |dia|
      funcionarios_divergencia ||= []
      funcionarios.each do |f|
        if DiaHelper.divergencia?(f,dia) && !DiaHelper.inconsistencia?(f,dia)
          funcionarios_divergencia.push(f)
        end
      end
      @divergencias.push([dia,funcionarios_divergencia])
    end
    @divergencias
  end

  def create
    d = Divergencia.new
    d.funcionario_id = params[:funcionario_id]
    d.data = params[:data]
    d.usuario = current_user
    d.save
    redirect_to :divergencias
  end

end
  