class RelatoriosController < ApplicationController
  skip_before_action :usuario_responsavel
  helper DiaHelper
  
  def index
    @setors = Setor.all
  end
  
  def executa
  	@datainicial = params[:datainicial]
  	@datafinal = params[:datafinal]
    @params = params
    setor = params[:widget][:setor_id]
    @funcionario = params[:widget][:funcionario_id]
    unless @funcionario.blank?
      setor = Funcionario.find(@funcionario).setor.id
    end
    if setor.blank?
  	  @setors = Setor.all
    else
      @setors = Setor.where(id: setor).all
    end
    render :bancohoras, layout: false
  end
  
end