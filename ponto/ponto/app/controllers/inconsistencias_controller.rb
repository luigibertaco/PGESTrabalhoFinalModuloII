class InconsistenciasController < ApplicationController
  #before_action :set_inconsistencia, only: [:show, :edit, :update, :destroy]
  helper DiaHelper
  
  def index
    @divergencias ||= []
    data_inicial = Batida.order(:data).all.any? ? Batida.order(:data).all.first.data : Date.today
    if current_user.administrador?
      funcionarios = Funcionario.all 
    else
      funcionarios = Funcionario.where(setor: current_user.setor)
    end
    (data_inicial..Date.today).map do |dia|
      funcionarios_divergencia ||= []
      funcionarios.each do |f|
        if DiaHelper.divergencia?(f,dia) && DiaHelper.inconsistencia?(f,dia)
          funcionarios_divergencia.push(f)
        end
      end
      @divergencias.push([dia,funcionarios_divergencia])
    end
    @divergencias
  end

  def ajustar
    @batidas = Batida.where(data: params[:data], funcionario_id: params[:funcionario]).order('time(hora)')
    @data = params[:data]
    @funcionario = Funcionario.find(params[:funcionario])
    render :show
  end
end
  